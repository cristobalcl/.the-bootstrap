#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/files.sh
source lib/colors.sh
source lib/system.sh

echo "==> ${LBLUE}Installing pyenv…${END}"
if [[ "$OS_NAME" == "darwin" ]]; then
    brew install pyenv
else
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv || echo "Already exist..."
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(~/.pyenv/bin/pyenv root)/plugins/pyenv-virtualenv || echo "Already exist..."
fi

eval "$(~/.pyenv/bin/pyenv init -)"
eval "$(~/.pyenv/bin/pyenv virtualenv-init -)"

echo "==> ${LBLUE}Installing Python 2.7.18…${END}"
~/.pyenv/bin/pyenv install 2.7.18 || echo "Already exist..."

echo "==> ${LBLUE}Installing Python 3.6.11…${END}"
~/.pyenv/bin/pyenv install 3.6.11 || echo "Already exist..."

echo "==> ${LBLUE}Installing Python 3.7.8…${END}"
~/.pyenv/bin/pyenv install 3.7.8 || echo "Already exist..."

echo "==> ${LBLUE}Installing Python 3.8.5…${END}"
~/.pyenv/bin/pyenv install 3.8.5 || echo "Already exist..."

echo "==> ${LBLUE}Installing poetry…${END}"
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python

echo "==> ${LBLUE}Installing flake8 config…${END}"
linked etc/flake8 ~/.config/
