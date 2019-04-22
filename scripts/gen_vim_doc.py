#!/usr/bin/env python3

import sys


def main():
    mapping = []
    plugs = []
    with open('etc/vim/vimrc') as f:
        for line in f.readlines():
            line = line.strip()
            if line.startswith('" MAP '):
                mapping.append(line.split('" MAP ', 1)[1])

            elif line.startswith('Plug \''):
                plugs.append(line.split('Plug \'', 1)[1].split('\'', 1)[0])

    print('Vim/NeoVim configuration')
    print('========================')
    print()
    print('Installed plugins')
    print('-----------------')

    for plug_doc in plugs:
        print('* [{}](https://github.com/{})'.format(plug_doc.split('/')[-1], plug_doc))

    print()
    print('Customized key binding')
    print('----------------------')

    for map_doc in mapping:
        print('* {}'.format(map_doc))

    return 0


if __name__ == '__main__':
    sys.exit(main())
