// This file is part of the brlaser printer driver.
//
// Copyright 2013 Peter De Wachter
//
// brlaser is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 2 of the License, or
// (at your option) any later version.
//
// brlaser is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with brlaser.  If not, see <http://www.gnu.org/licenses/>.

#include <stdio.h>
#include <signal.h>
#include <unistd.h>
#include <fcntl.h>
#include <cups/raster.h>
#include <algorithm>
#include <functional>
#include <string>
#include <array>
#include <map>
#include "config.h"
#include "job.h"
#include "debug.h"

#ifndef O_BINARY
#define O_BINARY 0
#endif


namespace {

cups_raster_t *ras;
volatile sig_atomic_t interrupted = 0;
cups_file_t* tempFileRasterRead;

void sigterm_handler(int sig) {
  interrupted = 1;
}

unsigned char reverseChar(unsigned char b) {
   b = (b & 0xF0) >> 4 | (b & 0x0F) << 4;
   b = (b & 0xCC) >> 2 | (b & 0x33) << 2;
   b = (b & 0xAA) >> 1 | (b & 0x55) << 1;
   return b;
}


bool next_line(std::vector<uint8_t> &buf) {
  if (interrupted) {
    return false;
  }

  ssize_t bytesReadForLine = cupsFileRead(tempFileRasterRead, (char*) buf.data(), buf.size());
  //fprintf(stderr, "DEBUG: " PACKAGE ": read from file is %zd and %zu\n", bytesReadForLine, buf.size());

  return bytesReadForLine == ((ssize_t) buf.size());
}


bool plain_ascii_string(const char *str) {
  bool result = true;
  for (; result && *str; str++) {
    result = *str >= 32 && *str <= 126;
  }
  return result;
}

std::string ascii_job_name(const char *job_id, const char *job_user, const char *job_name) {
  std::array<const char *, 3> parts = {{
    job_id,
    job_user,
    job_name
  }};
  std::string result;
  for (const char *part : parts) {
    if (*part && plain_ascii_string(part)) {
      if (!result.empty()) {
        result += '/';
      }
      result += part;
    }
  }
  if (result.empty()) {
    result = "brlaser";
  }
  const int max_size = 79;
  if (result.size() > max_size) {
    result.resize(max_size);
  }
  return result;
}

page_params build_page_params(const cups_page_header2_t &header) {
  static const std::array<std::string, 6> sources = {{
    "AUTO", "T1", "T2", "T3", "MP", "MANUAL"
  }};
  static const std::map<std::string, std::string> sizes = {
    { "A4", "A4" },
    { "A5", "A5" },
    { "A6", "A6" },
    { "B5", "B5" },
    { "B6", "B6" },
    { "EnvC5", "C5" },
    { "EnvMonarch", "MONARCH" },
    { "EnvPRC5", "DL" },
    { "EnvDL", "DL" },
    { "Executive", "EXECUTIVE" },
    { "Legal", "LEGAL" },
    { "Letter", "LETTER" }
  };

  page_params p = { };
  p.num_copies = header.NumCopies;
  p.resolution = header.HWResolution[0];
  p.economode = header.cupsInteger[10];
  p.mediatype = header.MediaType;
  p.duplex = header.Duplex;
  p.tumble = header.Tumble;

  if (header.MediaPosition < sources.size())
    p.sourcetray = sources[header.MediaPosition];
  else
    p.sourcetray = sources[0];

  auto size_it = sizes.find(header.cupsPageSizeName);
  if (size_it != sizes.end())
    p.papersize = size_it->second;
  else
    p.papersize = "A4";

  return p;
}

}  // namespace


int main(int argc, char *argv[]) {
  fprintf(stderr, "INFO: %s version %s\n", PACKAGE, VERSION);

  if (argc != 6 && argc != 7) {
      fprintf(stderr, "ERROR: rastertobrlaser job-id user title copies options [file]\n");
      fprintf(stderr, "INFO: This program is a CUPS filter. It is not intended to be run manually.\n");
      return 1;
  }
  const char *job_id = argv[1];
  const char *job_user = argv[2];
  const char *job_name = argv[3];
  // const int job_copies = atoi(argv[4]);
  // const char *job_options = argv[5];
  const char *job_filename = argv[6];
  // const char *job_charset = getenv("CHARSET");

  signal(SIGTERM, sigterm_handler);
  signal(SIGPIPE, SIG_IGN);

  int fd = STDIN_FILENO;
  if (job_filename) {
    fd = open(job_filename, O_RDONLY | O_BINARY);
    if (fd < 0) {
      fprintf(stderr, "ERROR: " PACKAGE ": Unable to open raster file\n");
      return 1;
    }
  }

#ifdef __OpenBSD__
  if (pledge("stdio", nullptr) != 0) {
    fprintf(stderr, "ERROR: " PACKAGE ": pledge failed\n");
    return 1;
  }
#endif

  ras = cupsRasterOpen(fd, CUPS_RASTER_READ);
  if (!ras) {
    fprintf(stderr, "DEBUG: " PACKAGE ": Cannot read raster data. Most likely an earlier filter in the pipeline failed.\n");
    return 1;
  }

  {
    job job(stdout, ascii_job_name(job_id, job_user, job_name));
    cups_page_header2_t header;
    while (!interrupted && cupsRasterReadHeader2(ras, &header)) {
      if (header.cupsBitsPerPixel != 1
          || header.cupsBitsPerColor != 1
          || header.cupsNumColors != 1
          || header.cupsBytesPerLine > 10000) {
        fprintf(stderr, "ERROR: " PACKAGE ": Page %d: Bogus raster data.\n", job.pages() + 1);
        dump_page_header(header);
        return 1;
      }
      if (job.pages() == 0) {
        fprintf(stderr, "DEBUG: " PACKAGE ": Page header of first page\n");
        dump_page_header(header);
      }

      char tempFileRasterName[1024];
      cups_file_t* tempFileRasterWrite = cupsTempFile2(tempFileRasterName, sizeof(tempFileRasterName));
      if(tempFileRasterWrite == NULL) {
        fprintf(stderr, "ERROR: " PACKAGE ": Temp file write creation failed\n");
        return 1;
      }
      fprintf(stderr, "DEBUG: " PACKAGE ": file name is %s blah\n", tempFileRasterName);

      unsigned char pixelDataBuffer[16384];
      unsigned pixelBytesRead, totalFileSize = 0;
      while((pixelBytesRead = cupsRasterReadPixels(ras, pixelDataBuffer, sizeof(pixelDataBuffer)))) {
        size_t bytesWritten = 0;
        while(bytesWritten != pixelBytesRead) {
          bytesWritten += cupsFileWrite(tempFileRasterWrite, (char*) pixelDataBuffer + bytesWritten, pixelBytesRead - bytesWritten);
        }

        totalFileSize += pixelBytesRead;
      }
      fprintf(stderr, "DEBUG: " PACKAGE ": filepos is %ld\n", cupsFileTell(tempFileRasterWrite));

      //Flush file
      cupsFileFlush(tempFileRasterWrite);
      cupsFileClose(tempFileRasterWrite);

      const bool shouldReverse = header.Duplex && header.Tumble;
      char tempFileRasterNameReverse[1024];
      if(shouldReverse) {
        //Make reverse file to write to
        cups_file_t* tempFileRasterWriteReverse = cupsTempFile2(tempFileRasterNameReverse, sizeof(tempFileRasterNameReverse));
        if(tempFileRasterWriteReverse == NULL) {
          fprintf(stderr, "ERROR: " PACKAGE ": Temp file write reverse creation failed\n");
          return 1;
        }
        fprintf(stderr, "DEBUG: " PACKAGE ": file name is %s reverse\n", tempFileRasterNameReverse);

        //Open file to read from original raster
        tempFileRasterRead = cupsFileOpen(tempFileRasterName, "r");
        if(tempFileRasterRead == NULL) {
          fprintf(stderr, "ERROR: " PACKAGE ": Temp file read creation failed\n");
          return 1;
        }
        fprintf(stderr, "DEBUG: " PACKAGE ": success in creating read side\n");

        //Write the reverse file
        const size_t bufferSize = sizeof(pixelDataBuffer);
        size_t currPositionFromBack = 0;
        while(totalFileSize > currPositionFromBack) {
          long int newPosition = totalFileSize - currPositionFromBack - bufferSize;
          unsigned int overrun = 0;
          if(newPosition < 0) {
            overrun = 0 - newPosition;
            newPosition = 0;
          }
          long int resSeek = cupsFileSeek(tempFileRasterRead, newPosition);
          fprintf(stderr, "DEBUG: " PACKAGE ": resSeek - %ld\n", resSeek);
          fprintf(stderr, "DEBUG: " PACKAGE ": bufferSize - %zu, newPosition - %ld, overrun - %u\n", bufferSize, newPosition, overrun);
          size_t sizeToRead = bufferSize - overrun;
          ssize_t readDataSize = cupsFileRead(tempFileRasterRead, (char*) pixelDataBuffer, sizeToRead);
          fprintf(stderr, "DEBUG: " PACKAGE ": reeadDataSize - %zd, sizeToRead %zu\n", readDataSize, sizeToRead);
          fprintf(stderr, "DEBUG: " PACKAGE ": filepos is %ld\n", cupsFileTell(tempFileRasterRead));

          currPositionFromBack += readDataSize;

          //Reverse buffer now
          for(unsigned int i = 0; i < readDataSize / 2; i++) {
            const unsigned char tmp = pixelDataBuffer[i];
            pixelDataBuffer[i] = reverseChar(pixelDataBuffer[readDataSize - i - 1]);
            pixelDataBuffer[readDataSize - i - 1] = reverseChar(tmp);
          }

          //Write to new file
          //fprintf(stderr, "DEBUG: " PACKAGE ": readDataSize is %zd\n", readDataSize);
          cupsFileWrite(tempFileRasterWriteReverse, (char*) pixelDataBuffer, readDataSize);
          //fprintf(stderr, "DEBUG: " PACKAGE ": filepos reverse is %ld\n", cupsFileTell(tempFileRasterWriteReverse));
        }

        cupsFileFlush(tempFileRasterWriteReverse);
        cupsFileClose(tempFileRasterWriteReverse);
        cupsFileClose(tempFileRasterRead);
      }

      //Read file
      tempFileRasterRead = cupsFileOpen(shouldReverse ? tempFileRasterNameReverse : tempFileRasterName, "r");
      if(tempFileRasterRead == NULL) {
        fprintf(stderr, "ERROR: " PACKAGE ": Temp file read creation failed\n");
        return 1;
      }
      fprintf(stderr, "DEBUG: " PACKAGE ": success in creating read side\n");

      job.encode_page(build_page_params(header),
                      header.cupsHeight,
                      header.cupsBytesPerLine,
                      next_line);

      //Close files so that new one can be made
      cupsFileClose(tempFileRasterRead);

      fprintf(stderr, "PAGE: %d %d\n", job.pages(), header.NumCopies);
    }

    if (job.pages() == 0) {
      fprintf(stderr, "ERROR: " PACKAGE ": No pages were found.\n");
    }
  }

  fflush(stdout);
  if (ferror(stdout)) {
    fprintf(stderr, "DEBUG: " PACKAGE ": Could not write print data. Most likely the CUPS backend failed.\n");
    return 1;
  }
  return 0;
}
