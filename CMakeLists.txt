cmake_minimum_required(VERSION 3.12.0)

project(android-build-tools)

include(GNUInstallDirs)

enable_language(C CXX)

option(ANDROID_BUILD_TOOLS_DEV_MODE "Enable dev mode to ease upstreaming of patches to Google" OFF)
option(ANDROID_BUILD_TOOLS_MUSL_LIBC "Enable workaround absence of sys/cdefs.h for musl libc" OFF)
option(ANDROID_BUILD_TOOLS_PATCH_VENDOR "Enable patching vendor projects using patches directory" ON)

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
find_package(BISON REQUIRED)
find_package(EXPAT REQUIRED)
find_package(FLEX REQUIRED)
find_package(fmt REQUIRED)
find_package(GTest REQUIRED)
find_package(Protobuf CONFIG)
find_package(Protobuf REQUIRED)
include_directories(${Protobuf_INCLUDE_DIRS})
include_directories(${CMAKE_CURRENT_BINARY_DIR})

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

find_package(PkgConfig REQUIRED)
pkg_check_modules(libpng REQUIRED IMPORTED_TARGET libpng)

set(ANDROID_VERSION "android-16.0.0_r2")
configure_file(version.h.in build/version.h @ONLY)
if(ANDROID_BUILD_TOOLS_MUSL_LIBC)
    configure_file(cdefs.h.in sys/cdefs.h @ONLY)
endif()

# The CMakeLists.txt in the vendor subdirectory is responsible for
# patching, building and installing the software.
set(ANDROID_PATCH_DIR ${CMAKE_CURRENT_SOURCE_DIR}/patches)
add_subdirectory(vendor)
