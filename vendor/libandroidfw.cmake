# SPDX-License-Identifier: Apache-2.0
# libandroidfw.cmake: cmake file for base/libs/androidfw directory

set(libandroidfw_SRCS
    base/libs/androidfw/ApkAssets.cpp
    base/libs/androidfw/ApkParsing.cpp
    base/libs/androidfw/Asset.cpp
    base/libs/androidfw/AssetDir.cpp
    base/libs/androidfw/AssetManager.cpp
    base/libs/androidfw/AssetManager2.cpp
    base/libs/androidfw/AssetsProvider.cpp
    base/libs/androidfw/AttributeResolution.cpp
    base/libs/androidfw/BigBuffer.cpp
    base/libs/androidfw/BigBufferStream.cpp
    base/libs/androidfw/ChunkIterator.cpp
    base/libs/androidfw/ConfigDescription.cpp
    base/libs/androidfw/FileStream.cpp
    base/libs/androidfw/Idmap.cpp
    base/libs/androidfw/LoadedArsc.cpp
    base/libs/androidfw/Locale.cpp
    base/libs/androidfw/LocaleData.cpp
    base/libs/androidfw/misc.cpp
    base/libs/androidfw/NinePatch.cpp
    base/libs/androidfw/ObbFile.cpp
    base/libs/androidfw/PosixUtils.cpp
    base/libs/androidfw/Png.cpp
    base/libs/androidfw/PngChunkFilter.cpp
    base/libs/androidfw/PngCrunch.cpp
    base/libs/androidfw/ResourceTimer.cpp
    base/libs/androidfw/ResourceTypes.cpp
    base/libs/androidfw/ResourceUtils.cpp
    base/libs/androidfw/StreamingZipInflater.cpp
    base/libs/androidfw/StringPool.cpp
    base/libs/androidfw/TypeWrappers.cpp
    base/libs/androidfw/Util.cpp
    base/libs/androidfw/ZipFileRO.cpp
    base/libs/androidfw/ZipUtils.cpp
)

if(NOT WIN32)
    list(APPEND libandroidfw_SRCS
        base/libs/androidfw/CursorWindow.cpp
    )
endif()

set(libandroidfw_pathutils_SRCS
    base/libs/androidfw/PathUtils.cpp
)

add_library(libandroidfw STATIC
    ${libandroidfw_SRCS}
    ${libandroidfw_pathutils_SRCS}
)

target_compile_definitions(libandroidfw PUBLIC
    NDEBUG
    STATIC_ANDROIDFW_FOR_TOOLS
)

target_include_directories(libandroidfw PUBLIC
    base/libs/androidfw/include
    base/libs/androidfw/include_pathutils
    native/include
)

target_link_libraries(libandroidfw PUBLIC
    libincfs
    libutils
    libziparchive
    PkgConfig::libpng
)
