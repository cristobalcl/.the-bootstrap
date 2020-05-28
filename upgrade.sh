#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/"

source lib/files.sh
source lib/colors.sh
source lib/system.sh

if [ "$OS_NAME" == "ubuntu" ]; then
    echo "==> ${LBLUE}Upgrading system…${END}"
    sudo apt update && sudo apt install aptitude -y
    sudo aptitude safe-upgrade -y
elif [ "$OS_NAME" == "darwin" ]; then
    echo "==> ${LBLUE}Upgrading brew packages…${END}"
    brew upgrade
# else
#     echo "==> ${RED}ERROR: OS not supported! The supported systems are: Ubuntu|OpenSuse${END}"
fi

# echo "==> ${LBLUE}Upgrading pip2 packages…${END}"
# python2 -m pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 python2 -m pip install -U

echo "==> ${LBLUE}Upgrading pip3 packages…${END}"
pip3 list --user --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U

echo "==> ${LBLUE}Upgrading NeoVim Python 2 environments packages…${END}"
source ~/.pyenv/versions/neovim2/bin/activate
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

echo "==> ${LBLUE}Upgrading NeoVim Python 3 environments packages…${END}"
source ~/.pyenv/versions/neovim3/bin/activate
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
