#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/files.sh
source lib/colors.sh

echo "==> ${LBLUE}Linking powerline-shell config…${END}"
directory ~/.config/powerline-shell
linked etc/powerline-shell.json ~/.config/powerline-shell/config.json
