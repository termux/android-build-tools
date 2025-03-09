# android-build-tools

This repository provides easier way to build [Android build tools] using
cmake and system provided toolchain.

[Android build tools]: https://developer.android.com/tools/releases/build-tools

## How to build

* Build dependencies: C and C++ toolchain, bison, flex, cmake, ninja,
  git, linux-headers, pkgconf.

* Runtime dependencies: libfmt, googletest, expat, libpng, protobuf.

* Build command:

  - clone this repository with git submodules.

    ```sh
    git clone --recurse-submodules --depth 1 <repository_url>
    ```

  - build with cmake.

    ```sh
    cmake -B build
    cmake --build build
    ```

  - install with cmake.

    ```sh
    cmake --install build
    ```

## Supported Tools

* aidl - Android Interface Definition Language (AIDL) Compiler

* aapt - Android Asset Packaging Tool

* aapt2 - Android Asset Packaging Tool, version 2

* zipalign - Zip alignment utility

## Development

The project follows android-XX.X.X_rYY tags from AOSP repositories.
See tags from any of the git submodules as reference. e.g. [base]

To update submodules, change the git tag in clone.sh and CMakeLists.txt.
Then execute clone.sh script and `git add` the submodules.

[base]: https://android.googlesource.com/platform/frameworks/base

## Todo

* Fix build issues with different supported OSes and compilers.

* Upstream patches to AOSP.

* Add other Android build tools.

## Similar projects

This project is based on the following.

* https://github.com/nmeum/android-tools

* https://github.com/lzhiyong/android-sdk-tools

## License

This project is licensed under Apache License Version 2.0, which is
same as the upstream Android repositories. See [LICENSE](./LICENSE.txt).
