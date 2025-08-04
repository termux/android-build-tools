# SPDX-License-Identifier: Apache-2.0
# CMakeLists.txt: cmake file for vendor directory

set(android-vendored
    base
    incremental_delivery
    native
    build
    libbase
    logging
    libziparchive
    aidl
    core
    zopfli
)

option(ANDROID_BUILD_TOOLS_PATCH_VENDOR "Enable patching vendor projects using patches directory" ON)

if(ANDROID_BUILD_TOOLS_PATCH_VENDOR AND EXISTS "${ANDROID_PATCH_DIR}/")
    execute_process(COMMAND git submodule --quiet update)
    foreach(v ${android-vendored})
        file(GLOB patches ${ANDROID_PATCH_DIR}/${v}/*.patch)
        if(patches)
            message(STATUS "Applying patches for: ${v}")

            if (ANDROID_BUILD_TOOLS_DEV_MODE)
                foreach (patch ${patches})
                    execute_process(COMMAND patch -d
                        ${CMAKE_CURRENT_SOURCE_DIR}/${v} -p1 -i ${patch}
                        RESULT_VARIABLE ret)
                    if(NOT "${ret}" STREQUAL "0")
                        message(FATAL_ERROR "Couldn't apply patch ${patch} for ${v}")
                    endif()
                endforeach(patch)
            else()
                execute_process(COMMAND git -C
                    ${CMAKE_CURRENT_SOURCE_DIR}/${v} am ${patches}
                    RESULT_VARIABLE ret)
                if(NOT "${ret}" STREQUAL "0")
                    message(FATAL_ERROR "Couldn't apply patches for ${v}")
                endif()
            endif()
        endif(patches)
    endforeach(v)
endif()

add_subdirectory(zopfli EXCLUDE_FROM_ALL)

include(aapt.cmake)
include(aapt2.cmake)
include(aidl.cmake)
include(libandroidfw.cmake)
include(libbase.cmake)
include(libcutils.cmake)
include(libincfs.cmake)
include(liblog.cmake)
include(libutils.cmake)
include(libziparchive.cmake)
include(zipalign.cmake)

install(TARGETS
    aidl
    aapt
    aapt2
    zipalign
    DESTINATION ${CMAKE_INSTALL_BINDIR}
)
