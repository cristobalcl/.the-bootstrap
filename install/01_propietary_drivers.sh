#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/colors.sh
source lib/system.sh

if [ "$OS_NAME" == "ubuntu" ]; then
    if [ ! -z "${TB_RECOMMENDED_DRIVERS}" ]; then
        echo "==> ${BROWN}Autoinstalling Ubuntu drivers!${END}"
        sudo ubuntu-drivers autoinstall
    else
        echo "==> ${BROWN}Warning! Set \$TB_RECOMMENDED_DRIVERS to autoinstall drivers. Skipping!${END}"
        echo "    Or run this by yourself: ${LRED}sudo ubuntu-drivers autoinstall${END}"
    fi
fi
