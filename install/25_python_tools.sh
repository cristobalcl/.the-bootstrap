#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/files.sh
source lib/colors.sh
source lib/system.sh

echo "==> ${LBLUE}Installing pyenv…${END}"
if [[ "$OS_NAME" == "Darwin" ]]; then
    brew install pyenv
else
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv || echo "Already exist..."

    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"

    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
fi

echo "==> ${LBLUE}Installing Python 3.6.10…${END}"
pyenv install 3.6.10 || echo "Already exist..."

echo "==> ${LBLUE}Installing Python 3.7.7…${END}"
pyenv install 3.7.7 || echo "Already exist..."

echo "==> ${LBLUE}Installing Python 3.8.2…${END}"
pyenv install 3.8.2 || echo "Already exist..."

echo "==> ${LBLUE}Installing poetry…${END}"
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python

echo "==> ${LBLUE}Installing flake8 config…${END}"
linked etc/flake8 ~/.config/
