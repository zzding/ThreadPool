# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_SOURCE_DIR = /home/zzder/vscodpro/ThreadPool

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zzder/vscodpro/ThreadPool/build

# Include any dependencies generated for this target.
include CMakeFiles/TestThreadPool.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/TestThreadPool.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/TestThreadPool.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/TestThreadPool.dir/flags.make

CMakeFiles/TestThreadPool.dir/src/TestThreadPool.cpp.o: CMakeFiles/TestThreadPool.dir/flags.make
CMakeFiles/TestThreadPool.dir/src/TestThreadPool.cpp.o: ../src/TestThreadPool.cpp
CMakeFiles/TestThreadPool.dir/src/TestThreadPool.cpp.o: CMakeFiles/TestThreadPool.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zzder/vscodpro/ThreadPool/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/TestThreadPool.dir/src/TestThreadPool.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TestThreadPool.dir/src/TestThreadPool.cpp.o -MF CMakeFiles/TestThreadPool.dir/src/TestThreadPool.cpp.o.d -o CMakeFiles/TestThreadPool.dir/src/TestThreadPool.cpp.o -c /home/zzder/vscodpro/ThreadPool/src/TestThreadPool.cpp

CMakeFiles/TestThreadPool.dir/src/TestThreadPool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TestThreadPool.dir/src/TestThreadPool.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zzder/vscodpro/ThreadPool/src/TestThreadPool.cpp > CMakeFiles/TestThreadPool.dir/src/TestThreadPool.cpp.i

CMakeFiles/TestThreadPool.dir/src/TestThreadPool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TestThreadPool.dir/src/TestThreadPool.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zzder/vscodpro/ThreadPool/src/TestThreadPool.cpp -o CMakeFiles/TestThreadPool.dir/src/TestThreadPool.cpp.s

CMakeFiles/TestThreadPool.dir/src/ThreadPool.cpp.o: CMakeFiles/TestThreadPool.dir/flags.make
CMakeFiles/TestThreadPool.dir/src/ThreadPool.cpp.o: ../src/ThreadPool.cpp
CMakeFiles/TestThreadPool.dir/src/ThreadPool.cpp.o: CMakeFiles/TestThreadPool.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zzder/vscodpro/ThreadPool/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/TestThreadPool.dir/src/ThreadPool.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/TestThreadPool.dir/src/ThreadPool.cpp.o -MF CMakeFiles/TestThreadPool.dir/src/ThreadPool.cpp.o.d -o CMakeFiles/TestThreadPool.dir/src/ThreadPool.cpp.o -c /home/zzder/vscodpro/ThreadPool/src/ThreadPool.cpp

CMakeFiles/TestThreadPool.dir/src/ThreadPool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TestThreadPool.dir/src/ThreadPool.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zzder/vscodpro/ThreadPool/src/ThreadPool.cpp > CMakeFiles/TestThreadPool.dir/src/ThreadPool.cpp.i

CMakeFiles/TestThreadPool.dir/src/ThreadPool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TestThreadPool.dir/src/ThreadPool.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zzder/vscodpro/ThreadPool/src/ThreadPool.cpp -o CMakeFiles/TestThreadPool.dir/src/ThreadPool.cpp.s

# Object files for target TestThreadPool
TestThreadPool_OBJECTS = \
"CMakeFiles/TestThreadPool.dir/src/TestThreadPool.cpp.o" \
"CMakeFiles/TestThreadPool.dir/src/ThreadPool.cpp.o"

# External object files for target TestThreadPool
TestThreadPool_EXTERNAL_OBJECTS =

TestThreadPool: CMakeFiles/TestThreadPool.dir/src/TestThreadPool.cpp.o
TestThreadPool: CMakeFiles/TestThreadPool.dir/src/ThreadPool.cpp.o
TestThreadPool: CMakeFiles/TestThreadPool.dir/build.make
TestThreadPool: CMakeFiles/TestThreadPool.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zzder/vscodpro/ThreadPool/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable TestThreadPool"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TestThreadPool.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/TestThreadPool.dir/build: TestThreadPool
.PHONY : CMakeFiles/TestThreadPool.dir/build

CMakeFiles/TestThreadPool.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/TestThreadPool.dir/cmake_clean.cmake
.PHONY : CMakeFiles/TestThreadPool.dir/clean

CMakeFiles/TestThreadPool.dir/depend:
	cd /home/zzder/vscodpro/ThreadPool/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zzder/vscodpro/ThreadPool /home/zzder/vscodpro/ThreadPool /home/zzder/vscodpro/ThreadPool/build /home/zzder/vscodpro/ThreadPool/build /home/zzder/vscodpro/ThreadPool/build/CMakeFiles/TestThreadPool.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/TestThreadPool.dir/depend

