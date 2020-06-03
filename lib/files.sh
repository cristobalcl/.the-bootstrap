source lib/colors.sh

directory() {
    if [ "$#" -ne 1 ]; then
        echo "${LRED}directory::ERROR: invalid number of arguments!${END}"
        exit 1
    fi

    mkdir -p $1
}

linked() {
    if [ "$#" -ne 2 ]; then
        echo "${LRED}linked::ERROR: invalid number of arguments!${END}"
        exit 1
    fi

    DIR=$(dirname "$2")
    mkdir -p ${DIR}

    ln -sf $(pwd)/$1 $2
}

linked_p() {
    if [ "$#" -ne 2 ]; then
        echo "${LRED}linked::ERROR: invalid number of arguments!${END}"
        exit 1
    fi

    ln -sf $1 $2
}

download() {
    if [ "$#" -ne 2 ]; then
        echo "${LRED}download::ERROR: invalid number of arguments!${END}"
        exit 1
    fi

    curl -L $1 > $2
}
