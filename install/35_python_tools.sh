#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/files.sh
source lib/colors.sh
source lib/system.sh

echo "==> ${LBLUE}Installing pyenv…${END}"
if [[ "$OS_NAME" == "Darwin" ]]; then
    brew install pyenv
elif [[ "$VERSION_CODENAME" == "xenial" ]]; then
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
fi

echo "==> ${LBLUE}Installing Python 3.6…${END}"
pyenv install 3.6.0

echo "==> ${LBLUE}Installing Python 3.7…${END}"
pyenv install 3.7.0

echo "==> ${LBLUE}Installing poetry…${END}"
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
