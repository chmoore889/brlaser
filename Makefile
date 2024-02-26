# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

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

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target test
test:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running tests..."
	/usr/bin/ctest --force-new-ctest-process $(ARGS)
.PHONY : test

# Special rule for the target test
test/fast: test
.PHONY : test/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# Special rule for the target list_install_components
list_install_components:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Available install components are: \"Unspecified\""
.PHONY : list_install_components

# Special rule for the target list_install_components
list_install_components/fast: list_install_components
.PHONY : list_install_components/fast

# Special rule for the target install
install: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Install the project..."
	/usr/bin/cmake -P cmake_install.cmake
.PHONY : install

# Special rule for the target install
install/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Install the project..."
	/usr/bin/cmake -P cmake_install.cmake
.PHONY : install/fast

# Special rule for the target install/local
install/local: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing only the local directory..."
	/usr/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
.PHONY : install/local

# Special rule for the target install/local
install/local/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing only the local directory..."
	/usr/bin/cmake -DCMAKE_INSTALL_LOCAL_ONLY=1 -P cmake_install.cmake
.PHONY : install/local/fast

# Special rule for the target install/strip
install/strip: preinstall
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing the project stripped..."
	/usr/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
.PHONY : install/strip

# Special rule for the target install/strip
install/strip/fast: preinstall/fast
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Installing the project stripped..."
	/usr/bin/cmake -DCMAKE_INSTALL_DO_STRIP=1 -P cmake_install.cmake
.PHONY : install/strip/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/chmoo/brlaser/CMakeFiles /home/chmoo/brlaser//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/chmoo/brlaser/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named rastertobrlaser

# Build rule for target.
rastertobrlaser: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 rastertobrlaser
.PHONY : rastertobrlaser

# fast build rule for target.
rastertobrlaser/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/rastertobrlaser.dir/build.make CMakeFiles/rastertobrlaser.dir/build
.PHONY : rastertobrlaser/fast

#=============================================================================
# Target rules for targets named brdecode

# Build rule for target.
brdecode: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 brdecode
.PHONY : brdecode

# fast build rule for target.
brdecode/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/brdecode.dir/build.make CMakeFiles/brdecode.dir/build
.PHONY : brdecode/fast

#=============================================================================
# Target rules for targets named test_lest

# Build rule for target.
test_lest: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 test_lest
.PHONY : test_lest

# fast build rule for target.
test_lest/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_lest.dir/build.make CMakeFiles/test_lest.dir/build
.PHONY : test_lest/fast

#=============================================================================
# Target rules for targets named test_line

# Build rule for target.
test_line: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 test_line
.PHONY : test_line

# fast build rule for target.
test_line/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_line.dir/build.make CMakeFiles/test_line.dir/build
.PHONY : test_line/fast

#=============================================================================
# Target rules for targets named test_block

# Build rule for target.
test_block: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 test_block
.PHONY : test_block

# fast build rule for target.
test_block/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_block.dir/build.make CMakeFiles/test_block.dir/build
.PHONY : test_block/fast

#=============================================================================
# Target rules for targets named test_job

# Build rule for target.
test_job: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 test_job
.PHONY : test_job

# fast build rule for target.
test_job/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_job.dir/build.make CMakeFiles/test_job.dir/build
.PHONY : test_job/fast

#=============================================================================
# Target rules for targets named check

# Build rule for target.
check: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 check
.PHONY : check

# fast build rule for target.
check/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/check.dir/build.make CMakeFiles/check.dir/build
.PHONY : check/fast

src/brdecode.o: src/brdecode.cc.o
.PHONY : src/brdecode.o

# target to build an object file
src/brdecode.cc.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/brdecode.dir/build.make CMakeFiles/brdecode.dir/src/brdecode.cc.o
.PHONY : src/brdecode.cc.o

src/brdecode.i: src/brdecode.cc.i
.PHONY : src/brdecode.i

# target to preprocess a source file
src/brdecode.cc.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/brdecode.dir/build.make CMakeFiles/brdecode.dir/src/brdecode.cc.i
.PHONY : src/brdecode.cc.i

src/brdecode.s: src/brdecode.cc.s
.PHONY : src/brdecode.s

# target to generate assembly for a file
src/brdecode.cc.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/brdecode.dir/build.make CMakeFiles/brdecode.dir/src/brdecode.cc.s
.PHONY : src/brdecode.cc.s

src/debug.o: src/debug.cc.o
.PHONY : src/debug.o

# target to build an object file
src/debug.cc.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/rastertobrlaser.dir/build.make CMakeFiles/rastertobrlaser.dir/src/debug.cc.o
.PHONY : src/debug.cc.o

src/debug.i: src/debug.cc.i
.PHONY : src/debug.i

# target to preprocess a source file
src/debug.cc.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/rastertobrlaser.dir/build.make CMakeFiles/rastertobrlaser.dir/src/debug.cc.i
.PHONY : src/debug.cc.i

src/debug.s: src/debug.cc.s
.PHONY : src/debug.s

# target to generate assembly for a file
src/debug.cc.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/rastertobrlaser.dir/build.make CMakeFiles/rastertobrlaser.dir/src/debug.cc.s
.PHONY : src/debug.cc.s

src/job.o: src/job.cc.o
.PHONY : src/job.o

# target to build an object file
src/job.cc.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/rastertobrlaser.dir/build.make CMakeFiles/rastertobrlaser.dir/src/job.cc.o
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_job.dir/build.make CMakeFiles/test_job.dir/src/job.cc.o
.PHONY : src/job.cc.o

src/job.i: src/job.cc.i
.PHONY : src/job.i

# target to preprocess a source file
src/job.cc.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/rastertobrlaser.dir/build.make CMakeFiles/rastertobrlaser.dir/src/job.cc.i
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_job.dir/build.make CMakeFiles/test_job.dir/src/job.cc.i
.PHONY : src/job.cc.i

src/job.s: src/job.cc.s
.PHONY : src/job.s

# target to generate assembly for a file
src/job.cc.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/rastertobrlaser.dir/build.make CMakeFiles/rastertobrlaser.dir/src/job.cc.s
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_job.dir/build.make CMakeFiles/test_job.dir/src/job.cc.s
.PHONY : src/job.cc.s

src/line.o: src/line.cc.o
.PHONY : src/line.o

# target to build an object file
src/line.cc.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/rastertobrlaser.dir/build.make CMakeFiles/rastertobrlaser.dir/src/line.cc.o
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_line.dir/build.make CMakeFiles/test_line.dir/src/line.cc.o
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_job.dir/build.make CMakeFiles/test_job.dir/src/line.cc.o
.PHONY : src/line.cc.o

src/line.i: src/line.cc.i
.PHONY : src/line.i

# target to preprocess a source file
src/line.cc.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/rastertobrlaser.dir/build.make CMakeFiles/rastertobrlaser.dir/src/line.cc.i
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_line.dir/build.make CMakeFiles/test_line.dir/src/line.cc.i
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_job.dir/build.make CMakeFiles/test_job.dir/src/line.cc.i
.PHONY : src/line.cc.i

src/line.s: src/line.cc.s
.PHONY : src/line.s

# target to generate assembly for a file
src/line.cc.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/rastertobrlaser.dir/build.make CMakeFiles/rastertobrlaser.dir/src/line.cc.s
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_line.dir/build.make CMakeFiles/test_line.dir/src/line.cc.s
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_job.dir/build.make CMakeFiles/test_job.dir/src/line.cc.s
.PHONY : src/line.cc.s

src/main.o: src/main.cc.o
.PHONY : src/main.o

# target to build an object file
src/main.cc.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/rastertobrlaser.dir/build.make CMakeFiles/rastertobrlaser.dir/src/main.cc.o
.PHONY : src/main.cc.o

src/main.i: src/main.cc.i
.PHONY : src/main.i

# target to preprocess a source file
src/main.cc.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/rastertobrlaser.dir/build.make CMakeFiles/rastertobrlaser.dir/src/main.cc.i
.PHONY : src/main.cc.i

src/main.s: src/main.cc.s
.PHONY : src/main.s

# target to generate assembly for a file
src/main.cc.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/rastertobrlaser.dir/build.make CMakeFiles/rastertobrlaser.dir/src/main.cc.s
.PHONY : src/main.cc.s

test/test_block.o: test/test_block.cc.o
.PHONY : test/test_block.o

# target to build an object file
test/test_block.cc.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_block.dir/build.make CMakeFiles/test_block.dir/test/test_block.cc.o
.PHONY : test/test_block.cc.o

test/test_block.i: test/test_block.cc.i
.PHONY : test/test_block.i

# target to preprocess a source file
test/test_block.cc.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_block.dir/build.make CMakeFiles/test_block.dir/test/test_block.cc.i
.PHONY : test/test_block.cc.i

test/test_block.s: test/test_block.cc.s
.PHONY : test/test_block.s

# target to generate assembly for a file
test/test_block.cc.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_block.dir/build.make CMakeFiles/test_block.dir/test/test_block.cc.s
.PHONY : test/test_block.cc.s

test/test_job.o: test/test_job.cc.o
.PHONY : test/test_job.o

# target to build an object file
test/test_job.cc.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_job.dir/build.make CMakeFiles/test_job.dir/test/test_job.cc.o
.PHONY : test/test_job.cc.o

test/test_job.i: test/test_job.cc.i
.PHONY : test/test_job.i

# target to preprocess a source file
test/test_job.cc.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_job.dir/build.make CMakeFiles/test_job.dir/test/test_job.cc.i
.PHONY : test/test_job.cc.i

test/test_job.s: test/test_job.cc.s
.PHONY : test/test_job.s

# target to generate assembly for a file
test/test_job.cc.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_job.dir/build.make CMakeFiles/test_job.dir/test/test_job.cc.s
.PHONY : test/test_job.cc.s

test/test_lest.o: test/test_lest.cc.o
.PHONY : test/test_lest.o

# target to build an object file
test/test_lest.cc.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_lest.dir/build.make CMakeFiles/test_lest.dir/test/test_lest.cc.o
.PHONY : test/test_lest.cc.o

test/test_lest.i: test/test_lest.cc.i
.PHONY : test/test_lest.i

# target to preprocess a source file
test/test_lest.cc.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_lest.dir/build.make CMakeFiles/test_lest.dir/test/test_lest.cc.i
.PHONY : test/test_lest.cc.i

test/test_lest.s: test/test_lest.cc.s
.PHONY : test/test_lest.s

# target to generate assembly for a file
test/test_lest.cc.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_lest.dir/build.make CMakeFiles/test_lest.dir/test/test_lest.cc.s
.PHONY : test/test_lest.cc.s

test/test_line.o: test/test_line.cc.o
.PHONY : test/test_line.o

# target to build an object file
test/test_line.cc.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_line.dir/build.make CMakeFiles/test_line.dir/test/test_line.cc.o
.PHONY : test/test_line.cc.o

test/test_line.i: test/test_line.cc.i
.PHONY : test/test_line.i

# target to preprocess a source file
test/test_line.cc.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_line.dir/build.make CMakeFiles/test_line.dir/test/test_line.cc.i
.PHONY : test/test_line.cc.i

test/test_line.s: test/test_line.cc.s
.PHONY : test/test_line.s

# target to generate assembly for a file
test/test_line.cc.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/test_line.dir/build.make CMakeFiles/test_line.dir/test/test_line.cc.s
.PHONY : test/test_line.cc.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... install"
	@echo "... install/local"
	@echo "... install/strip"
	@echo "... list_install_components"
	@echo "... rebuild_cache"
	@echo "... test"
	@echo "... check"
	@echo "... brdecode"
	@echo "... rastertobrlaser"
	@echo "... test_block"
	@echo "... test_job"
	@echo "... test_lest"
	@echo "... test_line"
	@echo "... src/brdecode.o"
	@echo "... src/brdecode.i"
	@echo "... src/brdecode.s"
	@echo "... src/debug.o"
	@echo "... src/debug.i"
	@echo "... src/debug.s"
	@echo "... src/job.o"
	@echo "... src/job.i"
	@echo "... src/job.s"
	@echo "... src/line.o"
	@echo "... src/line.i"
	@echo "... src/line.s"
	@echo "... src/main.o"
	@echo "... src/main.i"
	@echo "... src/main.s"
	@echo "... test/test_block.o"
	@echo "... test/test_block.i"
	@echo "... test/test_block.s"
	@echo "... test/test_job.o"
	@echo "... test/test_job.i"
	@echo "... test/test_job.s"
	@echo "... test/test_lest.o"
	@echo "... test/test_lest.i"
	@echo "... test/test_lest.s"
	@echo "... test/test_line.o"
	@echo "... test/test_line.i"
	@echo "... test/test_line.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

