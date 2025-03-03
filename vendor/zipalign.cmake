# SPDX-License-Identifier: Apache-2.0
# zipalign.cmake: cmake file for build/tools/zipalign directory

set(zipalign_SRCS
    build/tools/zipalign/ZipAlign.cpp
    build/tools/zipalign/ZipEntry.cpp
    build/tools/zipalign/ZipFile.cpp
    build/tools/zipalign/ZipAlignMain.cpp
)

add_executable(zipalign ${zipalign_SRCS})

target_include_directories(zipalign PRIVATE
    build/tools/zipalign/include
    zopfli/src
)

target_link_libraries(zipalign PRIVATE
    libutils
    libziparchive
    libzopfli
)
