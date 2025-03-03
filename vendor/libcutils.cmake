# SPDX-License-Identifier: Apache-2.0
# libcutils.cmake: cmake file for core/libcutils directory

set(libcutils_nonwindows_SRCS
    core/libcutils/fs.cpp
    core/libcutils/hashmap.cpp
    core/libcutils/multiuser.cpp
    core/libcutils/str_parms.cpp
)

set(libcutils_SRCS
    core/libcutils/config_utils.cpp
    core/libcutils/iosched_policy.cpp
    core/libcutils/load_file.cpp
    core/libcutils/native_handle.cpp
    core/libcutils/properties.cpp
    core/libcutils/record_stream.cpp
    core/libcutils/strlcpy.c
    core/libcutils/trace-host.cpp
    core/libcutils/ashmem-host.cpp
)

if(NOT WIN32)
    list(APPEND libcutils_SRCS
        core/libcutils/canned_fs_config.cpp
        core/libcutils/fs_config.cpp
        ${libcutils_nonwindows_SRCS}
    )
endif()

add_library(libcutils STATIC
    ${libcutils_SRCS}
)

target_include_directories(libcutils PRIVATE
    core/libutils/include
)

target_include_directories(libcutils PUBLIC
    core/libcutils/include
)

target_link_libraries(libcutils PUBLIC
    libbase
)
