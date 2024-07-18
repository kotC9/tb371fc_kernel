## Описание

Ядро на основе tb-q706f, поэтому много чего не работает. Однако андроид грузится, дисплей рисуется

## Инициализация

```bash
git clone --recurse-submodules https://github.com/kotC9/tb371fc_kernel.git
```

## Сборка

на linux машине(например debian 12 или ubuntu 24.04)

./build.sh

либо собирать через devcontainer, необходим докер

полученное ядро в ./build/kernel/arch/arm64/boot файл Image
полученные модули в ./build/vendor

