FROM ubuntu:latest
RUN apt-get upgrade
RUN apt-get update && yes | unminimize;\
    apt-get install -y mc;	
RUN apt-get install -y man
RUN apt-get install -y manpages-posix
RUN apt-get install -y tree
RUN apt-get install -y git 
RUN apt-get install -y git-flow
RUN apt-get install -y gcc
RUN apt-get install -y g++
RUN apt-get install -y gdb
RUN apt-get install -y gcc-arm-none-eabi
RUN apt-get install -y cmake
RUN apt-get install -y ninja-build 
RUN apt-get install -y libgtest-dev 
RUN apt-get install -y iputils-ping
RUN apt-get install -y net-tools
RUN apt-get install -y vim 
RUN apt-get install -y curl
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY .vimrc root/.vimrc
RUN vim +PlugInstall +qall
RUN apt-get install -y openssh-client
RUN apt-get install -y openssh-server
RUN apt-get install -y vsftpd
RUN apt-get install -y tmux
RUN apt-get install -y netcat-traditional
RUN apt-get install -y ftp
RUN apt-get install -y kmod
RUN apt-get install -y sudo
CMD bash
