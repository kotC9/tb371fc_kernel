set -e 
set -o pipefail

PROJECT=tb371fc
CONFIG=vendor/${PROJECT}_defconfig
GCC_PATH=${PWD}/prebuilts/aarch64-linux-android-4.9/bin
CC=clang-9
export PATH=$GCC_PATH:$PATH


BUILD_PATH=${PWD}/build
KERNEL_BUILD_PATH=${BUILD_PATH}/kernel
MOD_PATH=${BUILD_PATH}/vendor

mkdir -p build

make -j40 -C kernel O=${KERNEL_BUILD_PATH} ARCH=arm64 CROSS_COMPILE=aarch64-linux-android- CLANG_TRIPLE=aarch64-linux-gnu- CC=${CC} ${CONFIG}
make -j40 V=1 -C kernel O=${KERNEL_BUILD_PATH} ARCH=arm64 CROSS_COMPILE=aarch64-linux-android- CLANG_TRIPLE=aarch64-linux-gnu- CC=${CC}
make -j40 -C kernel O=${KERNEL_BUILD_PATH} ARCH=arm64 CROSS_COMPILE=aarch64-linux-android- CLANG_TRIPLE=aarch64-linux-gnu- CC=${CC} modules
make -j40 -C kernel O=${KERNEL_BUILD_PATH} ARCH=arm64 CROSS_COMPILE=aarch64-linux-android- CLANG_TRIPLE=aarch64-linux-gnu- CC=${CC} modules_install INSTALL_MOD_PATH=${MOD_PATH}
