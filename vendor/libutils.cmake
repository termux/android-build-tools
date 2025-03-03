# SPDX-License-Identifier: Apache-2.0
# libutils.cmake: cmake file for core/libutils directory

set(libutils_binder_SRCS
    core/libutils/binder/Errors.cpp
    core/libutils/binder/RefBase.cpp
    core/libutils/binder/SharedBuffer.cpp
    core/libutils/binder/String16.cpp
    core/libutils/binder/String8.cpp
    core/libutils/binder/StrongPointer.cpp
    core/libutils/binder/Unicode.cpp
    core/libutils/binder/VectorImpl.cpp
)

set(libutils_SRCS
    core/libutils/FileMap.cpp
    core/libutils/JenkinsHash.cpp
    core/libutils/LightRefBase.cpp
    core/libutils/NativeHandle.cpp
    core/libutils/Printer.cpp
    core/libutils/StopWatch.cpp
    core/libutils/SystemClock.cpp
    core/libutils/Threads.cpp
    core/libutils/Timers.cpp
    core/libutils/Tokenizer.cpp
    core/libutils/misc.cpp
)

if(NOT WIN32)
    list(APPEND libutils_SRCS
        core/libutils/Looper.cpp
    )
endif()

add_library(libutils STATIC
    ${libutils_SRCS}
    ${libutils_binder_SRCS}
)

target_compile_definitions(libutils PRIVATE
    ANDROID_UTILS_REF_BASE_DISABLE_IMPLICIT_CONSTRUCTION
)

target_include_directories(libutils PUBLIC
    core/libsystem/include
    core/libutils/include
)

target_link_libraries(libutils PUBLIC
    libcutils
    liblog
)
