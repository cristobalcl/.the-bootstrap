#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/colors.sh

if ! command -v node &> /dev/null; then
    if grep --quiet '^ID=ubuntu' /etc/os-release; then
        echo "==> ${LBLUE}Adding Node.js repositories 10.x…${END}"
        curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

        echo "==> ${LBLUE}Installing Node.js 10.x…${END}"
        sudo apt-get install -y nodejs
    fi
fi
