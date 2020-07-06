#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/files.sh
source lib/colors.sh
source lib/system.sh

if [[ "$VERSION_CODENAME" == "bionic" ]]; then
    sudo apt install vim-athena -y
elif [[ "$VERSION_CODENAME" == "xenial" ]]; then
    sudo apt install vim-athena-py2 -y
fi

echo "==> ${LBLUE}Linking Vim configuration…${END}"
directory ~/.vim
directory ~/.vim/undodir

linked etc/vim/ftplugin ~/.vim/
#linked etc/vim/ftdetect ~/.vim/
linked etc/vim/UltiSnips ~/.vim/
linked etc/vim/vimrc ~/.vimrc
# linked etc/vim/vimrc.local ~/.vimrc.local
# linked etc/vim/vimrc.local.bundles ~/.vimrc.local.bundles

echo "==> ${LBLUE}Install NeoVim…${END}"
directory ~/bin
download https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage ~/bin/nvim
chmod u+x  ~/bin/nvim

# if grep --quiet '^ID=ubuntu' /etc/os-release; then
#     if [ ! -f /etc/apt/sources.list.d/neovim-ppa-ubuntu-stable-xenial.list ]; then
#         sudo add-apt-repository -y ppa:neovim-ppa/stable
#     fi
#     sudo apt-get update
#     sudo apt-get install neovim -y
# fi

echo "==> ${LBLUE}Linking NeoVim configuration…${END}"
directory ~/.config/nvim
directory ~/.local/share/nvim/site/

linked etc/vim/vimrc ~/.config/nvim/init.vim
linked etc/vim/UltiSnips ~/.config/nvim/UltiSnips
linked etc/vim/coc-settings.json ~/.config/nvim/coc-settings.json
linked_p ~/.vim ~/.nvim
linked_p ~/.vim/autoload ~/.local/share/nvim/site/autoload

# Reference:
# https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim#using-virtual-environments
echo "==> ${LBLUE}Creating virtual environments for NeoVim…${END}"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# pyenv install 2.7.11
# pyenv install 3.7.4

# pyenv virtualenv 2.7.11 neovim2
pyenv virtualenv 3.8.2 neovim3

# pyenv activate neovim2
# pip install neovim

pyenv activate neovim3
pip install neovim

# TODO Put all this elsewhere...
pip install flake8
linked_p `pyenv which flake8` ~/bin/flake8

pip install black
linked_p `pyenv which black` ~/bin/black

pip install mypy
linked_p `pyenv which mypy` ~/bin/mypy

pyenv deactivate
