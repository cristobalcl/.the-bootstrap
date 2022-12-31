#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/files.sh
source lib/colors.sh

if [ "$OS_NAME" == "ubuntu" ]; then
    echo "==> ${LBLUE}Setup Hashicorp repo…${END}"
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update
fi

if ! command -v ansible &> /dev/null; then
    # echo "==> ${LBLUE}Adding Ansible repository…${END}"
    # sudo apt-add-repository ppa:ansible/ansible -y
    # sudo apt-get update

    echo "==> ${LBLUE}Installing Ansible…${END}"
    if [ "$OS_NAME" == "ubuntu" ]; then
        sudo apt-get install ansible -y
    elif [[ "$OS_NAME" == "darwin" ]]; then
        pip3 install --user ansible
    fi
fi

if ! command -v vagrant &> /dev/null; then
    if [ "$OS_NAME" == "ubuntu" ]; then
        echo "==> ${LBLUE}Installing Vagrant…${END}"
        sudo aptitude install vagrant
    fi
fi

if ! command -v packer &> /dev/null; then
    if [ "$OS_NAME" == "ubuntu" ]; then
        echo "==> ${LBLUE}Installing Packer…${END}"
        sudo aptitude install packer
    fi
fi

if ! command -v terraform &> /dev/null; then
    if [ "$OS_NAME" == "ubuntu" ]; then
        echo "==> ${LBLUE}Installing Terraform (and its Language Server)…${END}"
        sudo aptitude install terraform terraform-ls
    fi
fi
