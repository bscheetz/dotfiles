FROM ubuntu:19.04

WORKDIR /dotfiles

RUN apt-get update && \
      apt-get -y install sudo \
      software-properties-common \
      vim

COPY . /dotfiles

CMD /bin/bash
