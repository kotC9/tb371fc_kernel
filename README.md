## Описание

Ядро на основе tb-q706f, поэтому много чего не работает. Однако андроид грузится, дисплей рисуется

Проверено на ZUI 664 версии

## Инициализация

```bash
git clone --recurse-submodules https://github.com/kotC9/tb371fc_kernel.git
```

## Сборка

на linux машине(протестировано на debian 11) установить нужные пакеты для сборки:

```bash
sudo apt install build-essential bc \
    kmod cpio \
    flex libncurses5-dev \
    libelf-dev libssl-dev dwarves \
    bison python-is-python2 python3 python2 \
    adb fastboot clang-9
```

либо воспользоваться devcontainer, необходим докер

Сборка: 

```bash
./build.sh
```

полученное ядро в ./build/kernel/arch/arm64/boot файл Image
полученные модули в ./build/vendor

## packer

используется для автоматической сборки и записи boot.img.

!!!примечание!!! - используется слот b, при необходимости поменяйте на другой

делайте бекапы раздела boot

для упаковки собранного ядра в boot.img и записи через fastboot:

```bash
./upload.sh
```