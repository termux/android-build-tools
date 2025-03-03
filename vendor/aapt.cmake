# SPDX-License-Identifier: Apache-2.0
# aapt.cmake: cmake file for base/tools/aapt directory

set(libaapt_SRCS
    base/tools/aapt/AaptAssets.cpp
    base/tools/aapt/AaptConfig.cpp
    base/tools/aapt/AaptUtil.cpp
    base/tools/aapt/AaptXml.cpp
    base/tools/aapt/ApkBuilder.cpp
    base/tools/aapt/Command.cpp
    base/tools/aapt/CrunchCache.cpp
    base/tools/aapt/FileFinder.cpp
    base/tools/aapt/Images.cpp
    base/tools/aapt/Package.cpp
    base/tools/aapt/pseudolocalize.cpp
    base/tools/aapt/Resource.cpp
    base/tools/aapt/ResourceFilter.cpp
    base/tools/aapt/ResourceIdCache.cpp
    base/tools/aapt/ResourceTable.cpp
    base/tools/aapt/SourcePos.cpp
    base/tools/aapt/StringPool.cpp
    base/tools/aapt/Utils.cpp
    base/tools/aapt/WorkQueue.cpp
    base/tools/aapt/XMLNode.cpp
    base/tools/aapt/ZipEntry.cpp
    base/tools/aapt/ZipFile.cpp
)

add_library(libaapt STATIC
    ${libaapt_SRCS}
)

target_link_libraries(libaapt PUBLIC
    libandroidfw
    EXPAT::EXPAT
)

add_executable(aapt
    base/tools/aapt/Main.cpp
)

target_link_libraries(aapt PRIVATE
    libaapt
)
