# SPDX-License-Identifier: Apache-2.0
# aapt2.cmake: cmake file for base/tools/aapt2 directory

set(libaapt2_SRCS
    base/tools/aapt2/compile/IdAssigner.cpp
    base/tools/aapt2/compile/InlineXmlFormatParser.cpp
    base/tools/aapt2/compile/PseudolocaleGenerator.cpp
    base/tools/aapt2/compile/Pseudolocalizer.cpp
    base/tools/aapt2/compile/XmlIdCollector.cpp
    base/tools/aapt2/configuration/ConfigurationParser.cpp
    base/tools/aapt2/dump/DumpManifest.cpp
    base/tools/aapt2/filter/AbiFilter.cpp
    base/tools/aapt2/filter/ConfigFilter.cpp
    base/tools/aapt2/format/Archive.cpp
    base/tools/aapt2/format/Container.cpp
    base/tools/aapt2/format/binary/BinaryResourceParser.cpp
    base/tools/aapt2/format/binary/ResChunkPullParser.cpp
    base/tools/aapt2/format/binary/ResEntryWriter.cpp
    base/tools/aapt2/format/binary/TableFlattener.cpp
    base/tools/aapt2/format/binary/XmlFlattener.cpp
    base/tools/aapt2/format/proto/ProtoDeserialize.cpp
    base/tools/aapt2/format/proto/ProtoSerialize.cpp
    base/tools/aapt2/io/File.cpp
    base/tools/aapt2/io/FileSystem.cpp
    base/tools/aapt2/io/StringStream.cpp
    base/tools/aapt2/io/Util.cpp
    base/tools/aapt2/io/ZipArchive.cpp
    base/tools/aapt2/link/AutoVersioner.cpp
    base/tools/aapt2/link/FeatureFlagsFilter.cpp
    base/tools/aapt2/link/FlagDisabledResourceRemover.cpp
    base/tools/aapt2/link/ManifestFixer.cpp
    base/tools/aapt2/link/NoDefaultResourceRemover.cpp
    base/tools/aapt2/link/PrivateAttributeMover.cpp
    base/tools/aapt2/link/ReferenceLinker.cpp
    base/tools/aapt2/link/ResourceExcluder.cpp
    base/tools/aapt2/link/TableMerger.cpp
    base/tools/aapt2/link/XmlCompatVersioner.cpp
    base/tools/aapt2/link/XmlNamespaceRemover.cpp
    base/tools/aapt2/link/XmlReferenceLinker.cpp
    base/tools/aapt2/optimize/MultiApkGenerator.cpp
    base/tools/aapt2/optimize/ResourceDeduper.cpp
    base/tools/aapt2/optimize/ResourceFilter.cpp
    base/tools/aapt2/optimize/Obfuscator.cpp
    base/tools/aapt2/optimize/VersionCollapser.cpp
    base/tools/aapt2/process/ProductFilter.cpp
    base/tools/aapt2/process/SymbolTable.cpp
    base/tools/aapt2/split/TableSplitter.cpp
    base/tools/aapt2/text/Printer.cpp
    base/tools/aapt2/text/Unicode.cpp
    base/tools/aapt2/text/Utf8Iterator.cpp
    base/tools/aapt2/util/Files.cpp
    base/tools/aapt2/util/Util.cpp
    base/tools/aapt2/Debug.cpp
    base/tools/aapt2/DominatorTree.cpp
    base/tools/aapt2/java/AnnotationProcessor.cpp
    base/tools/aapt2/java/ClassDefinition.cpp
    base/tools/aapt2/java/JavaClassGenerator.cpp
    base/tools/aapt2/java/ManifestClassGenerator.cpp
    base/tools/aapt2/java/ProguardRules.cpp
    base/tools/aapt2/LoadedApk.cpp
    base/tools/aapt2/Resource.cpp
    base/tools/aapt2/ResourceParser.cpp
    base/tools/aapt2/ResourceTable.cpp
    base/tools/aapt2/ResourceUtils.cpp
    base/tools/aapt2/ResourceValues.cpp
    base/tools/aapt2/SdkConstants.cpp
    base/tools/aapt2/trace/TraceBuffer.cpp
    base/tools/aapt2/xml/XmlActionExecutor.cpp
    base/tools/aapt2/xml/XmlDom.cpp
    base/tools/aapt2/xml/XmlPullParser.cpp
    base/tools/aapt2/xml/XmlUtil.cpp
    base/tools/aapt2/ValueTransformer.cpp
)

protobuf_generate_cpp(PROTO_SRCS PROTO_HDRS
    base/tools/aapt2/ApkInfo.proto
    base/tools/aapt2/Configuration.proto
    base/tools/aapt2/Resources.proto
    base/tools/aapt2/ResourceMetadata.proto
    base/tools/aapt2/ResourcesInternal.proto
)

add_library(libaapt2 STATIC
    ${libaapt2_SRCS}
    ${PROTO_SRCS}
)

target_include_directories(libaapt2 PUBLIC
    base/cmds/idmap2/libidmap2_policies/include
    base/tools/aapt2
    ${CMAKE_CURRENT_BINARY_DIR}
)

target_link_libraries(libaapt2 PUBLIC
    libandroidfw
    EXPAT::EXPAT
    protobuf::libprotobuf
)

set(TOOL_SRCS
    base/tools/aapt2/cmd/ApkInfo.cpp
    base/tools/aapt2/cmd/Command.cpp
    base/tools/aapt2/cmd/Compile.cpp
    base/tools/aapt2/cmd/Convert.cpp
    base/tools/aapt2/cmd/Diff.cpp
    base/tools/aapt2/cmd/Dump.cpp
    base/tools/aapt2/cmd/Link.cpp
    base/tools/aapt2/cmd/Optimize.cpp
    base/tools/aapt2/cmd/Util.cpp
)

add_executable(aapt2
    base/tools/aapt2/Main.cpp
    ${TOOL_SRCS}
)

target_link_libraries(aapt2 PRIVATE
    libaapt2
)
