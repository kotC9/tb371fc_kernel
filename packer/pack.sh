#dtc -I dts -O dtb -o boot_original.img-dtb boot_original.img-dtb.dts
set -e 
set -o pipefail

rm -f ./build/boot/boot_original.img
mkdir -p ./build/boot

KERNEL_PATH=./build/kernel/arch/arm64/boot
EXTRACTED_PATH=$(dirname "$0")/boot

./prebuilts/mkbootimg \
--base "$(cat ${EXTRACTED_PATH}/boot_original.img-base)" \
--cmdline "$(cat ${EXTRACTED_PATH}/boot_original.img-cmdline)" \
--dtb ${EXTRACTED_PATH}/boot_original.img-dtb \
--dtb_offset "$(cat ${EXTRACTED_PATH}/boot_original.img-dtb_offset)" \
--kernel_offset "$(cat ${EXTRACTED_PATH}/boot_original.img-kernel_offset)" \
--os_patch_level "$(cat ${EXTRACTED_PATH}/boot_original.img-os_patch_level)" \
--os_version "$(cat ${EXTRACTED_PATH}/boot_original.img-os_version)" \
--pagesize "$(cat ${EXTRACTED_PATH}/boot_original.img-pagesize)" \
--ramdisk_offset "$(cat ${EXTRACTED_PATH}/boot_original.img-ramdisk_offset)" \
--second_offset "$(cat ${EXTRACTED_PATH}/boot_original.img-second_offset)" \
--tags_offset "$(cat ${EXTRACTED_PATH}/boot_original.img-tags_offset)" \
--kernel ${KERNEL_PATH}/Image \
--ramdisk ${EXTRACTED_PATH}/boot_original.img-ramdisk \
--board "$(cat ${EXTRACTED_PATH}/boot_original.img-board)" \
--header_version "$(cat ${EXTRACTED_PATH}/boot_original.img-header_version)" \
--hashtype "$(cat ${EXTRACTED_PATH}/boot_original.img-hashtype)" \
--output ./build/boot/boot.img

echo "packed"
