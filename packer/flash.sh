set -e 
set -o pipefail

fastboot set_active b
fastboot flash boot_b ./build/boot/boot.img
fastboot reboot

echo "flashed"