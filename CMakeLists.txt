cmake_minimum_required(VERSION 3.12.0)

project(android-build-tools)

include(GNUInstallDirs)

enable_language(C CXX)

# Use C11 with GNU extensions.
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_EXTENSIONS ON)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Use C++23 with GNU extensions.
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Suppress unnecessary warnings
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-attributes -Wno-deprecated-declarations")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-attributes -Wno-deprecated-declarations")

# For off64_t
add_compile_definitions(_FILE_OFFSET_BITS=64 _LARGEFILE64_SOURCE)

# Dependencies
add_subdirectory(vendor/zopfli EXCLUDE_FROM_ALL)

find_package(BISON REQUIRED)
find_package(EXPAT REQUIRED)
find_package(FLEX REQUIRED)
find_package(fmt REQUIRED)
find_package(Protobuf CONFIG)
find_package(Protobuf REQUIRED)
include_directories(${Protobuf_INCLUDE_DIRS})
include_directories(${CMAKE_CURRENT_BINARY_DIR})

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

find_package(PkgConfig REQUIRED)
pkg_check_modules(libpng REQUIRED IMPORTED_TARGET libpng)

option(ANDROID_BUILD_TOOLS_MUSL_LIBC "Enable workaround absence of sys/cdefs.h for musl libc" OFF)

set(ANDROID_VERSION "android-15.0.0_r17")
configure_file(version.h.in build/version.h @ONLY)
if(ANDROID_BUILD_TOOLS_MUSL_LIBC)
    configure_file(cdefs.h.in sys/cdefs.h @ONLY)
endif()

# The CMakeLists.txt in the vendor subdirectory is responsible for
# patching, building and installing the software.
set(ANDROID_PATCH_DIR ${CMAKE_CURRENT_SOURCE_DIR}/patches)
add_subdirectory(vendor)
