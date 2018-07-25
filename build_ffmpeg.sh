#!/bin/bash

. init_build_env.sh

pushd ffmpeg

CPU='cortex-a8'

make clean

export PKG_CONFIG_PATH=$TOOLCHAIN_PREFIX/lib/pkgconfig

./configure \
--prefix=$BASEDIR/build/ \
--target-os=$TARGET_OS \
--enable-cross-compile \
--cross-prefix=$CROSS_PREFIX \
--arch=$NDK_ABI \
--cpu=$CPU \
--sysroot=$NDK_SYSROOT \
--extra-cflags="-I$TOOLCHAIN_PREFIX/include -pie -fPIE $CFLAGS -D__ANDROID_API__=$ANDROID_API_VERSION -U_FILE_OFFSET_BITS -Os -fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -mfloat-abi=softfp -marm" \
--extra-ldflags="-L$TOOLCHAIN_PREFIX/lib $LDFLAGS -pie -fPIE" \
--extra-libs="-lgcc" \
--pkg-config=$PKG_CONFIG_PATH \
--enable-version3 \
--enable-hardcoded-tables \
--disable-debug \
--disable-ffplay \
--disable-ffprobe \
--disable-ffserver \
--enable-gpl \
--enable-libmp3lame \
--disable-yasm \
--disable-doc \
--disable-asm \
--disable-shared \
--enable-static || exit 1

make -j4 && make install || exit 1

popd
