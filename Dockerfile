FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install sudo && \
    adduser --gecos '' --home /home/user user && \
    echo 'user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER user

WORKDIR /home/user/dotfiles

RUN sudo apt-get -y install software-properties-common curl vim

COPY . /home/user/dotfiles

CMD /bin/bash
