FROM debian:bullseye

ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

RUN apt update && DEBIAN_FRONTEND=noninteractive apt -y install \
    libusb-1.0-0 \
    libusb-1.0-0-dev \
    libudev-dev \
    libudev0 \
    libudev1 \
    git \ 
    clangd \
    wget \
    locales \
    usbutils \
    sudo \
    make \
    build-essential \
    bc \
    kmod \
    cpio \
    flex \
    libncurses5-dev \
    libelf-dev \
    libssl-dev \
    dwarves \
    bison \
    python2 \
    python3 \
    python-is-python2 \
    adb \
    fastboot \
    clang-9

RUN apt clean && \
    echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN sed -i -e \
    's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen

ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU:ru
ENV LC_LANG ru_RU.UTF-8
ENV LC_ALL ru_RU.UTF-8

USER $USERNAME

ENTRYPOINT ["bash"]