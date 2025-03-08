#!/usr/bin/env bash

set -x

GIT_BRANCH="${1:-"android-15.0.0_r23"}"

cd vendor

declare -a urls=(
    https://android.googlesource.com/platform/build
    https://android.googlesource.com/platform/external/zopfli
    https://android.googlesource.com/platform/frameworks/base
    https://android.googlesource.com/platform/frameworks/native
    https://android.googlesource.com/platform/system/core
    https://android.googlesource.com/platform/system/incremental_delivery
    https://android.googlesource.com/platform/system/libbase
    https://android.googlesource.com/platform/system/libziparchive
    https://android.googlesource.com/platform/system/logging
    https://android.googlesource.com/platform/system/tools/aidl
)

for url in "${urls[@]}"; do
    git clone --depth 1 --branch "$GIT_BRANCH" "$url"
done
