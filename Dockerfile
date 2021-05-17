FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install sudo && \
    adduser --gecos '' user && \
    echo 'user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER user

WORKDIR /dotfiles

RUN sudo apt-get -y install software-properties-common curl vim

COPY . /dotfiles

CMD /bin/bash
