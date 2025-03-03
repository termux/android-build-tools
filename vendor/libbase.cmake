# SPDX-License-Identifier: Apache-2.0
# libbase.cmake: cmake file for libbase directory

set(libbase_SRCS
    libbase/abi_compatibility.cpp
    libbase/chrono_utils.cpp
    libbase/file.cpp
    libbase/hex.cpp
    libbase/logging.cpp
    libbase/mapped_file.cpp
    libbase/parsebool.cpp
    libbase/parsenetaddress.cpp
    libbase/posix_strerror_r.cpp
    libbase/process.cpp
    libbase/properties.cpp
    libbase/result.cpp
    libbase/stringprintf.cpp
    libbase/strings.cpp
    libbase/threads.cpp
    libbase/test_utils.cpp
)

if(WIN32)
    list(APPEND libbase_SRCS
        libbase/errors_windows.cpp
        libbase/utf8.cpp
    )
else()
    list(APPEND libbase_SRCS
        libbase/cmsg.cpp
        libbase/errors_unix.cpp
    )
endif()

add_library(libbase STATIC ${libbase_SRCS})

if(WIN32)
    target_compile_definitions(libbase PRIVATE
        _POSIX_THREAD_SAFE_FUNCTIONS
    )
endif()

target_include_directories(libbase PUBLIC
    libbase/include
)

target_link_libraries(libbase PUBLIC
    fmt::fmt
    liblog
    Threads::Threads
)
