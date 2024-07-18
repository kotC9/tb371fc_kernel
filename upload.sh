set -e 
set -o pipefail
./packer/pack.sh
./packer/flash.sh