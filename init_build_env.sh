export BASEDIR=$(pwd)
export TOOLCHAIN_PREFIX=${BASEDIR}/android-ndk-toolchain

export NDK_ROOT_PATH=${NDK_ROOT}
export NDK_ABI='arm'
export NDK_TOOLCHAIN_ABI='arm-linux-androideabi'
export NDK_TOOLCHAIN_ABI_VERSION=4.9
export NDK_CROSS_PREFIX="${NDK_TOOLCHAIN_ABI}"
export ANDROID_API_VERSION=19

export TARGET_OS=linux

if [ ! -d "$TOOLCHAIN_PREFIX" ]; then
  ${NDK_ROOT_PATH}/build/tools/make-standalone-toolchain.sh \
    --toolchain=${NDK_TOOLCHAIN_ABI}-${NDK_TOOLCHAIN_ABI_VERSION} \
    --platform=android-${ANDROID_API_VERSION} \
    --install-dir=${TOOLCHAIN_PREFIX}
fi

export CROSS_PREFIX=${TOOLCHAIN_PREFIX}/bin/${NDK_CROSS_PREFIX}-
export NDK_SYSROOT=${TOOLCHAIN_PREFIX}/sysroot

export PKG_CONFIG_PATH=$TOOLCHAIN_PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH

export PATH=$NDK_CROSS_PREFIX/bin:$PATH

export CC="${CROSS_PREFIX}gcc --sysroot=${NDK_SYSROOT}"
export LD="${CROSS_PREFIX}ld"
export RANLIB="${CROSS_PREFIX}ranlib"
export STRIP="${CROSS_PREFIX}strip"
export READELF="${CROSS_PREFIX}readelf"
export OBJDUMP="${CROSS_PREFIX}objdump"
export ADDR2LINE="${CROSS_PREFIX}addr2line"
export AR="${CROSS_PREFIX}ar"
export AS="${CROSS_PREFIX}as"
export CXX="${CROSS_PREFIX}g++"
export OBJCOPY="${CROSS_PREFIX}objcopy"
export ELFEDIT="${CROSS_PREFIX}elfedit"
export CPP="${CROSS_PREFIX}cpp"
export DWP="${CROSS_PREFIX}dwp"
export GCONV="${CROSS_PREFIX}gconv"
export GDP="${CROSS_PREFIX}gdb"
export GPROF="${CROSS_PREFIX}gprof"
export NM="${CROSS_PREFIX}nm"
export SIZE="${CROSS_PREFIX}size"
export STRINGS="${CROSS_PREFIX}strings"
export CXXFLAGS="-lstdc++"
