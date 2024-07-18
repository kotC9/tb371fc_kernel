## Описание

Ядро на основе tb-q706f, поэтому много чего не работает. Однако андроид грузится, дисплей рисуется

Проверено на ZUI 664 версии

## Инициализация

```bash
git clone --recurse-submodules https://github.com/kotC9/tb371fc_kernel.git
```

## Сборка

на linux машине(например debian 12) установить нужные пакеты для сборки:

```bash
# apt install build-essential bc \
    kmod cpio \
    flex libncurses5-dev \
    libelf-dev libssl-dev dwarves \
    bison python-is-python3 python3
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