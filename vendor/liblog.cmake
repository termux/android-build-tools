# SPDX-License-Identifier: Apache-2.0
# liblog.cmake: cmake file for logging/liblog directory

set(liblog_SRCS
    logging/liblog/log_event_list.cpp
    logging/liblog/log_event_write.cpp
    logging/liblog/logger_name.cpp
    logging/liblog/logger_read.cpp
    logging/liblog/logger_write.cpp
    logging/liblog/logprint.cpp
    logging/liblog/properties.cpp
)

add_library(liblog STATIC ${liblog_SRCS})

target_compile_definitions(liblog PRIVATE
    LIBLOG_LOG_TAG=1006
    SNET_EVENT_LOG_TAG=1397638484
    ANDROID_DEBUGGABLE=0
)

target_include_directories(liblog PRIVATE
    core/libcutils/include
    libbase/include
)

target_include_directories(liblog PUBLIC
    logging/liblog/include
)
