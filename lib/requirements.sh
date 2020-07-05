source lib/files.sh

install_apt() {
    echo "==> ${LBLUE}Installing apt dependencies…${END}"
    cat requirements/apt.txt | grep -v '^#' | grep -v -e '^[[:space:]]*$' | sudo xargs aptitude install -y
}

install_zypper() {
    echo "==> ${LBLUE}Installing zypper dependencies…${END}"
    cat requirements/zypper.txt | grep -v '^#' | sudo xargs zypper install -y
}

install_debian() {
    echo "==> ${LBLUE}Installing Debian packages dependencies…${END}"
    cat requirements/deb.txt | grep -v '^#' | grep -v -e '^[[:space:]]*$' | while IFS= read package; do
        echo "--> ${LYELLOW}${package}${END}…"
        download ${package} /tmp/package.deb
        sudo dpkg -i /tmp/package.deb
    done
}

install_brew() {
    echo "==> ${LBLUE}Installing Homebrew dependencies…${END}"
        cat requirements/brew.txt | grep -v '^#' | grep -v -e '^[[:space:]]*$' | while IFS= read package; do
        echo "--> ${LYELLOW}${package}${END}…"
        brew install $package
    done
    cat requirements/brew.cask.txt | grep -v '^#' | grep -v -e '^[[:space:]]*$' | while IFS= read package; do
        echo "--> ${LYELLOW}[cask] ${package}${END}…"
        brew cask install $package
    done
}

install_snap() {
    echo "==> ${LBLUE}Installing Snap dependencies…${END}"
    cat requirements/snap.txt | grep -v '^#' | grep -v -e '^[[:space:]]*$' | while IFS= read package; do
        echo "--> ${LYELLOW}${package}${END}…"
        sudo snap install $package || sudo snap refresh $package
    done
}

install_links() {
    echo "==> ${LBLUE}Linking files…${END}"
    cat requirements/links.txt | grep -v '^#' | grep -v -e '^[[:space:]]*$' | while IFS= read link; do
        linked ${link/\~/$HOME}
    done
}

install_git() {
    echo "==> ${LBLUE}Installing git repositories…${END}"
    cat requirements/git.txt | grep -v '^#' | grep -v -e '^[[:space:]]*$' | while IFS= read repo; do
        git clone ${repo/\~/$HOME} || echo "Error installing git repo: ${repo}"
    done
}
