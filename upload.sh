set -e 
set -o pipefail
./packer/pack.sh
# patch with magisk27
sh magisk-patcher/boot_patch.sh ./build/boot/boot.img ./build/boot/boot.img
./packer/flash.sh