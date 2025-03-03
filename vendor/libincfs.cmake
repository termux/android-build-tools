# SPDX-License-Identifier: Apache-2.0
# libincfs.cmake: cmake file for incremental_delivery/incfs directory

set(libincfs_SRCS
    incremental_delivery/incfs/util/map_ptr.cpp
)

add_library(libincfs STATIC ${libincfs_SRCS})

target_include_directories(libincfs PUBLIC
    incremental_delivery/incfs/util/include
)

target_link_libraries(libincfs PUBLIC
    libbase
    libutils
)
