#!/bin/bash

. init_build_env.sh

pushd lame-3.100

make clean

./configure \
  --with-pic \
  --with-sysroot="$NDK_SYSROOT" \
  --host="arm-linux" \
  --enable-static \
  --disable-shared \
  --prefix="${TOOLCHAIN_PREFIX}" || exit 1

make CFLAGS="-D__ANDROID_API__=$ANDROID_API_VERSION" -j4 install || exit 1

popd