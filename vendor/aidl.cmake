# SPDX-License-Identifier: Apache-2.0
# aidl.cmake: cmake file for aidl directory

set(aidl_SRCS
        aidl/aidl_checkapi.cpp
        aidl/aidl_const_expressions.cpp
        aidl/aidl_dumpapi.cpp
        aidl/aidl_language.cpp
        aidl/aidl_to_common.cpp
        aidl/aidl_to_cpp_common.cpp
        aidl/aidl_to_cpp.cpp
        aidl/aidl_to_java.cpp
        aidl/aidl_to_ndk.cpp
        aidl/aidl_to_rust.cpp
        aidl/aidl_typenames.cpp
        aidl/aidl.cpp
        aidl/ast_java.cpp
        aidl/check_valid.cpp
        aidl/code_writer.cpp
        aidl/comments.cpp
        aidl/diagnostics.cpp
        aidl/generate_aidl_mappings.cpp
        aidl/generate_cpp.cpp
        aidl/generate_cpp_analyzer.cpp
        aidl/generate_java_binder.cpp
        aidl/generate_java.cpp
        aidl/generate_ndk.cpp
        aidl/generate_rust.cpp
        aidl/import_resolver.cpp
        aidl/io_delegate.cpp
        aidl/location.cpp
        aidl/logging.cpp
        aidl/options.cpp
        aidl/parser.cpp
        aidl/permission.cpp
        aidl/preprocess.cpp
        aidl/main.cpp
)

bison_target(
    AidlParser
    ${CMAKE_CURRENT_SOURCE_DIR}/aidl/aidl_language_y.yy
    ${CMAKE_CURRENT_BINARY_DIR}/aidl/aidl_language_y.cpp
    DEFINES_FILE ${CMAKE_CURRENT_BINARY_DIR}/aidl/aidl_language_y.h
    )

flex_target(
    AidlScanner
    ${CMAKE_CURRENT_SOURCE_DIR}/aidl/aidl_language_l.ll
    ${CMAKE_CURRENT_BINARY_DIR}/aidl/aidl_language_l.cpp
    DEFINES_FILE ${CMAKE_CURRENT_BINARY_DIR}/aidl/aidl_language_l.h
)

add_flex_bison_dependency(AidlScanner AidlParser)

add_executable(aidl
    ${aidl_SRCS}
    ${BISON_AidlParser_OUTPUTS}
    ${FLEX_AidlScanner_OUTPUTS}
)

target_link_libraries(aidl
    libbase
)
