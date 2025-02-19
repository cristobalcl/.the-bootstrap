#!/usr/bin/env bash

set -e

cd "$(dirname "$0")/.."

source lib/files.sh
source lib/colors.sh
source lib/system.sh
source lib/requirements.sh

if [ "$OS_NAME" == "ubuntu" ]; then
    echo "==> ${LBLUE}Updating system…${END}"
    sudo apt update && sudo apt install aptitude -y
    sudo aptitude safe-upgrade -y
    install_apt
elif [ "$OS_NAME" == "opensuse" ]; then
    install_zypper
# else
#     echo "==> ${RED}ERROR: OS not supported! The supported systems are: Ubuntu|OpenSuse${END}"
fi

if [ "$OS_NAME" == "ubuntu" ] || [ "$OS_NAME" == "opensuse" ]; then
    install_debian
fi

if [ "$OS_NAME" == "darwin" ]; then
  echo "==> ${LBLUE}Installing Homebrew…${END}"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  install_brew
fi

# if [ "$OS_NAME" == "ubuntu" ]; then
#     if ! command -v pip2 &> /dev/null; then
#         echo "==> ${LBLUE}Install pip2…${END}"
#         sudo add-apt-repository universe
#         sudo apt update
#         sudo apt install python2
#         curl https://bootstrap.pypa.io/get-pip.py --output /tmp/get-pip.py
#         sudo python2 /tmp/get-pip.py
#     fi
# fi

# echo "==> ${LBLUE}Installing Python 2 dependencies…${END}"
# cat requirements/pip2.txt | grep -v '^#' | grep -v -e '^[[:space:]]*$' | while IFS= read package; do
#     echo "--> ${LYELLOW}${package}${END}…"
#     pip2 install --upgrade --user $package
# done

echo "==> ${LBLUE}Updating pip3…${END}"
sudo pip3 install --upgrade pip

echo "==> ${LBLUE}Installing Python 3 dependencies…${END}"
cat requirements/pip3.txt | grep -v '^#' | grep -v -e '^[[:space:]]*$' | while IFS= read package; do
    echo "--> ${LYELLOW}${package}${END}…"
    pip3 install --upgrade --user $package
done

if [ "$OS_NAME" == "ubuntu" ] || [ "$OS_NAME" == "opensuse" ]; then
    install_pipx
fi

if [ "$OS_NAME" == "ubuntu" ] || [ "$OS_NAME" == "opensuse" ]; then
    install_snap
fi

echo "==> ${LBLUE}Creating default directories…${END}"
directory ~/bin
directory ~/tmp
directory ~/Proyectos

install_links

echo "==> ${LBLUE}Linking scripts…${END}"
ls -1 bin/*.sh | while IFS= read file_path; do
    linked ${file_path} ~/bin/
done

git config --global user.email "ccarnerolinan@gmail.com"
git config --global user.name "Cristóbal Carnero Liñán"

install_git
