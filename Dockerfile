FROM ubuntu:latest
RUN apt-get update && yes | unminimize;
RUN apt-get upgrade;
RUN apt-get install -y mc;\
    apt-get install -y man;\
    apt-get install -y manpages-posix;\
    apt-get install -y tree;\
    apt-get install -y git;\
    apt-get install -y gcc;\
    apt-get install -y g++;\
    apt-get install -y gdb;\
    apt-get install -y gcc-arm-none-eabi;\
    apt-get install -y cmake;\
    apt-get install -y ninja-build;\
    apt-get install -y libgtest-dev;\
    apt-get install -y iputils-ping;\
    apt-get install -y net-tools;\
    apt-get install -y vim;\
    apt-get install -y curl;\
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY .vimrc root/.vimrc
RUN vim +PlugInstall +qall;\
    apt-get install -y openssh-client;\
    apt-get install -y openssh-server;\
    echo 'root:root' | chpasswd;\
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config;
EXPOSE 22
RUN apt-get install -y vsftpd;\
    apt-get install -y tmux;\
    apt-get install -y netcat-traditional;\
    apt-get install -y ftp;\
    apt-get install -y kmod;\
    apt-get install -y sudo;
ENTRYPOINT service ssh start && bash
