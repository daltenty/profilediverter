cmake_minimum_required(VERSION 3.8)
project(ProfileDiverter)

set(CMAKE_CXX_STANDARD 11)

find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK3 REQUIRED gtk+-3.0)

# Setup CMake to use GTK+, tell the compiler where to look for headers
# and to the linker where to look for libraries
include_directories(${GTK3_INCLUDE_DIRS})
link_directories(${GTK3_LIBRARY_DIRS})

# Add other flags to the compiler
add_definitions(${GTK3_CFLAGS_OTHER})

set(SOURCE_FILES DiversionManager.cpp DiversionService.cpp DiversionService.h Diversion.cpp Diversion.h)
add_executable(pdivert ${SOURCE_FILES})
target_link_libraries(pdivert ${GTK3_LIBRARIES})