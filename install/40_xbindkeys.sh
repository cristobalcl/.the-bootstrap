#!/usr/bin/env bash

set -e

if xset q &>/dev/null; then
    cd "$(dirname "$0")/.."

    source lib/files.sh
    source lib/colors.sh

    echo "==> ${LBLUE}Linking xbindkeys configuration…${END}"
    linked etc/xbindkeysrc ~/.xbindkeysrc

    if ! pgrep xbindkeysx &> /dev/null; then
        echo "==> ${LBLUE}Launching xbindkeys…${END}"
        xbindkeys -f ~/.xbindkeysrc
    fi
fi
