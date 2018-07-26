#!/bin/bash

. init_build_env.sh

pushd x264

make clean

./configure \
--cross-prefix=$CROSS_PREFIX \
--sysroot=$NDK_SYSROOT \
--prefix=$TOOLCHAIN_PREFIX \
--host="arm-linux" \
--enable-pic \
--disable-asm \
--disable-cli \
--extra-cflags="-D__ANDROID_API__=$ANDROID_API_VERSION" \
--enable-static || exit 1

make -j4 && make install || exit 1

popd
