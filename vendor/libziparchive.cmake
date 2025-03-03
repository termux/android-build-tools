# SPDX-License-Identifier: Apache-2.0
# libziparchive.cmake: cmake file for libziparchive directory

set(libziparchive_SRCS
    libziparchive/zip_archive.cc
    libziparchive/zip_archive_stream_entry.cc
    libziparchive/zip_cd_entry_map.cc
    libziparchive/zip_error.cpp
    libziparchive/zip_writer.cc
)

add_library(libziparchive STATIC
    ${libziparchive_SRCS}
)

target_compile_definitions(libziparchive PUBLIC
    INCFS_SUPPORT_DISABLED=1
    ZLIB_CONST
)

target_include_directories(libziparchive PUBLIC
    libziparchive/incfs_support/include
    libziparchive/include
)

target_link_libraries(libziparchive PUBLIC
    libbase
    z
)
