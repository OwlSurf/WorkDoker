FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8

# Base system utilities and host compilers
RUN apt-get update && apt-get upgrade -y && \
    yes | unminimize && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        git \
        sudo \
        tree \
        mc \
        vim \
        tmux \
        man-db \
        manpages \
        manpages-posix \
        kmod \
        # Host toolchain
        build-essential \
        gcc \
        g++ \
        gdb \
        cmake \
        ninja-build \
        libgtest-dev \
        # Networking / remote access
        iputils-ping \
        net-tools \
        netcat-traditional \
        openssh-client \
        openssh-server \
        vsftpd \
        ftp \
        # ARM bare-metal (Cortex-M/R)
        gcc-arm-none-eabi \
        binutils-arm-none-eabi \
        libnewlib-arm-none-eabi \
        libstdc++-arm-none-eabi-newlib \
        # ARM Linux cross (AArch64 + ARMv7 hard-float)
        gcc-aarch64-linux-gnu \
        g++-aarch64-linux-gnu \
        gcc-arm-linux-gnueabihf \
        g++-arm-linux-gnueabihf \
        # Debug / flash / emulate
        gdb-multiarch \
        openocd \
        stlink-tools \
        dfu-util \
        qemu-system-arm \
        qemu-user-static \
    && rm -rf /var/lib/apt/lists/*

# Vim plugins
RUN curl -fLo /root/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY .vimrc /root/.vimrc
RUN vim +PlugInstall +qall

# SSH: lab/test container credentials (change for anything beyond local use)
RUN mkdir -p /var/run/sshd && \
    echo 'root:root' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

ENTRYPOINT ["bash", "-c", "service ssh start && exec bash"]
