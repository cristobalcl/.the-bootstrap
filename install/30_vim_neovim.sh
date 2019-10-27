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

linked $(pwd)/etc/vim/ftplugin ~/.vim/
#linked $(pwd)/etc/vim/ftdetect ~/.vim/
linked $(pwd)/etc/vim/UltiSnips ~/.vim/
linked $(pwd)/etc/vim/vimrc ~/.vimrc
# linked $(pwd)/etc/vim/vimrc.local ~/.vimrc.local
# linked $(pwd)/etc/vim/vimrc.local.bundles ~/.vimrc.local.bundles

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

linked $(pwd)/etc/vim/vimrc ~/.config/nvim/init.vim
linked $(pwd)/etc/vim/UltiSnips ~/.config/nvim/UltiSnips
linked $(pwd)/etc/vim/coc-settings.json ~/.config/nvim/coc-settings.json
linked ~/.vim ~/.nvim
linked ~/.vim/autoload ~/.local/share/nvim/site/autoload

# Reference:
# https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim#using-virtual-environments
echo "==> ${LBLUE}Creating virtual environments for NeoVim…${END}"
pyenv install 2.7.11
pyenv install 3.7.4

pyenv virtualenv 2.7.11 neovim2
pyenv virtualenv 3.7.4 neovim3

pyenv activate neovim2
pip install neovim

pyenv activate neovim3
pip install neovim

# TODO Put all this elsewhere...
pip install flake8
ln -s `pyenv which flake8` ~/bin/

pip install black
ln -s `pyenv which black` ~/bin/

pip install mypy
ln -s `pyenv which mypy` ~/bin/

pyenv deactivate
