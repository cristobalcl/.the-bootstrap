#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/files.sh
source lib/colors.sh

if ! command -v ansible &> /dev/null; then
    echo "==> ${LBLUE}Adding Ansible repository…${END}"
    sudo apt-add-repository ppa:ansible/ansible -y
    sudo apt-get update

    echo "==> ${LBLUE}Installing Ansible…${END}"
    sudo apt-get install ansible -y
fi

if ! command -v vagrant &> /dev/null; then
    VAG_VERSION=`curl -L https://releases.hashicorp.com/vagrant/ 2> /dev/null | grep -v 'alpha\|beta\|rc\|oci' | grep -m 1 'vagrant_' | grep -oh -m 1 '[0-9]\+\.[0-9]\+\.[0-9]\+' | head -n 1`

    echo "==> ${LBLUE}Downloading Vagrant ${VAG_VERSION}…${END}"
    download "https://releases.hashicorp.com/vagrant/${VAG_VERSION}/vagrant_${VAG_VERSION}_x86_64.deb" /tmp/vagrant.deb

    echo "==> ${LBLUE}Installing Vagrant ${VAG_VERSION}…${END}"
    sudo dpkg -i /tmp/vagrant.deb
    rm /tmp/vagrant.deb
fi

if ! command -v packer &> /dev/null; then
    PAC_VERSION=`curl -L https://releases.hashicorp.com/packer/ 2> /dev/null | grep -v 'alpha\|beta\|rc\|oci' | grep -m 1 'packer_' | grep -oh -m 1 '[0-9]\+\.[0-9]\+\.[0-9]\+' | head -n 1`

    echo "==> ${LBLUE}Downloading Packer ${PAC_VERSION}…${END}"
    download "https://releases.hashicorp.com/packer/${PAC_VERSION}/packer_${PAC_VERSION}_linux_amd64.zip" /tmp/packer.zip

    echo "==> ${LBLUE}Installing Packer ${PAC_VERSION}…${END}"
    unzip /tmp/packer.zip -d ~/bin/
    rm /tmp/packer.zip
fi

if ! command -v terraform &> /dev/null; then
    TER_VERSION=`curl -L https://releases.hashicorp.com/terraform/ 2> /dev/null | grep -v 'alpha\|beta\|rc\|oci' | grep -m 1 'terraform_' | grep -oh -m 1 '[0-9]\+\.[0-9]\+\.[0-9]\+' | head -n 1`

    echo "==> ${LBLUE}Downloading Terraform ${TER_VERSION}…${END}"
    download "https://releases.hashicorp.com/terraform/${TER_VERSION}/terraform_${TER_VERSION}_linux_amd64.zip" /tmp/terraform.zip
    # download "https://releases.hashicorp.com/terraform/${TER_VERSION}/terraform_${TER_VERSION}_darwin_amd64.zip" /tmp/terraform.zip

    echo "==> ${LBLUE}Installing Terraform ${TER_VERSION}…${END}"
    unzip /tmp/terraform.zip -d ~/bin/
    rm /tmp/terraform.zip
fi
