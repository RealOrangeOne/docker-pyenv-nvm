FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev

RUN apt-get remove -y python3

RUN curl -L https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

RUN curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

COPY setup-pyenv-nvm.sh /opt/setup-pyenv-nvm.sh

RUN echo 'export PATH="~/.pyenv/bin:$PATH"' >>~/.bashrc
RUN echo 'eval "$(pyenv init -)"' >>~/.bashrc
RUN echo 'eval "$(pyenv virtualenv-init -)"' >>~/.bashrc

RUN echo 'source ~/.nvm/nvm.sh' >> ~/.bashrc

RUN apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*
