# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/chmoo/brlaser

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/chmoo/brlaser

# Include any dependencies generated for this target.
include CMakeFiles/test_block.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/test_block.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/test_block.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test_block.dir/flags.make

CMakeFiles/test_block.dir/test/test_block.cc.o: CMakeFiles/test_block.dir/flags.make
CMakeFiles/test_block.dir/test/test_block.cc.o: test/test_block.cc
CMakeFiles/test_block.dir/test/test_block.cc.o: CMakeFiles/test_block.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/chmoo/brlaser/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/test_block.dir/test/test_block.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/test_block.dir/test/test_block.cc.o -MF CMakeFiles/test_block.dir/test/test_block.cc.o.d -o CMakeFiles/test_block.dir/test/test_block.cc.o -c /home/chmoo/brlaser/test/test_block.cc

CMakeFiles/test_block.dir/test/test_block.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_block.dir/test/test_block.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/chmoo/brlaser/test/test_block.cc > CMakeFiles/test_block.dir/test/test_block.cc.i

CMakeFiles/test_block.dir/test/test_block.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_block.dir/test/test_block.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/chmoo/brlaser/test/test_block.cc -o CMakeFiles/test_block.dir/test/test_block.cc.s

# Object files for target test_block
test_block_OBJECTS = \
"CMakeFiles/test_block.dir/test/test_block.cc.o"

# External object files for target test_block
test_block_EXTERNAL_OBJECTS =

test_block: CMakeFiles/test_block.dir/test/test_block.cc.o
test_block: CMakeFiles/test_block.dir/build.make
test_block: CMakeFiles/test_block.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/chmoo/brlaser/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test_block"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_block.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test_block.dir/build: test_block
.PHONY : CMakeFiles/test_block.dir/build

CMakeFiles/test_block.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test_block.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test_block.dir/clean

CMakeFiles/test_block.dir/depend:
	cd /home/chmoo/brlaser && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/chmoo/brlaser /home/chmoo/brlaser /home/chmoo/brlaser /home/chmoo/brlaser /home/chmoo/brlaser/CMakeFiles/test_block.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test_block.dir/depend

