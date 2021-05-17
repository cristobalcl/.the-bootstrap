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
linked etc/vim/UltiSnips ~/.config/nvim/
# linked etc/vim/coc-settings.json ~/.config/nvim/coc-settings.json
linked_p ~/.vim ~/.nvim
linked_p ~/.vim/autoload ~/.local/share/nvim/site/autoload

# Reference:
# https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim#using-virtual-environments
echo "==> ${LBLUE}Creating virtual environments for NeoVim…${END}"
eval "$(~/.pyenv/bin/pyenv init -)"
eval "$(~/.pyenv/bin/pyenv virtualenv-init -)"

# ~/.pyenv/bin/pyenv install 2.7.11
# ~/.pyenv/bin/pyenv install 3.7.4

~/.pyenv/bin/pyenv virtualenv 2.7.18 neovim2
~/.pyenv/bin/pyenv virtualenv 3.8.5 neovim3

~/.pyenv/bin/pyenv activate neovim2
pip install pynvim

~/.pyenv/bin/pyenv activate neovim3
pip install pynvim

# TODO Put all this elsewhere...
pip install flake8
linked_p `~/.pyenv/bin/pyenv which flake8` ~/bin/flake8

pip install black
linked_p `~/.pyenv/bin/pyenv which black` ~/bin/black

pip install isort
linked_p `~/.pyenv/bin/pyenv which isort` ~/bin/isort

pip install mypy
linked_p `~/.pyenv/bin/pyenv which mypy` ~/bin/mypy

pip install 'python-language-server[all]'
linked_p `~/.pyenv/bin/pyenv which pyls` ~/bin/pyls

pip install pyls-mypy
pip install pyls-black
pip install pyls-isort

~/.pyenv/bin/pyenv deactivate
