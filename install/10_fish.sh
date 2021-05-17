#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/files.sh
source lib/colors.sh
source lib/system.sh

if [ "$OS_NAME" == "ubuntu" ] || [ "$OS_NAME" == "opensuse" ]; then
  echo "==> ${LBLUE}Installing Fish…${END}"
  if [ "$OS_NAME" == "ubuntu" ]; then
      sudo apt-add-repository ppa:fish-shell/release-3 -y
      sudo apt-get update
      sudo apt-get install fish -y
  elif [ "$OS_NAME" == "opensuse" ]; then
    sudo zypper install fish
  # else
  #     echo "==> ${RED}ERROR: OS not supported! The supported systems are: Ubuntu|OpenSuse${END}"
  #     exit 1
  fi
fi

echo "==> ${LBLUE}Linking Fish configuration…${END}"
directory ~/.config/fish
linked etc/fish/aliases.fish ~/.config/fish/aliases.fish
linked etc/fish/config.fish ~/.config/fish/config.fish

echo "==> ${LBLUE}Installing Fisherman…${END}"
directory ~/.config/fish/functions
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

echo "==> ${LBLUE}Installing Fisherman dependencies…${END}"
cat requirements/fisher.txt | grep -v '^#' | while IFS= read package; do
    echo "--> ${LYELLOW}${package}${END}…"
    fish -c "fisher install $package"
done

echo "==> ${LRED}To making Fish the default shell run this:${END}"
echo 'chsh -s `which fish`'
