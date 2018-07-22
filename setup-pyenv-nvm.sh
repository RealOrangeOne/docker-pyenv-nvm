#!/usr/bin/env bash

export PATH="~/.pyenv/bin:$PATH"

. ~/.nvm/nvm.sh
nvm install

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

bash -l -c "$*"
