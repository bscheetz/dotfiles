FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        sudo \
        software-properties-common \
        curl \
        vim \
        git \
        zsh \
        ansible \
    && rm -rf /var/lib/apt/lists/* \
    && adduser --gecos '' --home /home/user user \
    && echo 'user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER user
WORKDIR /home/user/dotfiles
COPY --chown=user:user . /home/user/dotfiles

CMD ["/bin/bash"]
