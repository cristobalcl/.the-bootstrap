#!/usr/bin/env bash

set -e

source lib/system.sh

if [ "$OS_NAME" == "ubuntu" ] || [ "$OS_NAME" == "opensuse" ]; then
  if xset q &>/dev/null; then
      cd "$(dirname "$0")/.."

      source lib/files.sh
      source lib/colors.sh

      echo "==> ${LBLUE}Installing Ubuntu dependencies for desktop…${END}"
      cat requirements/apt.desktop.txt | grep -v '^#' | grep -v -e '^[[:space:]]*$' | sudo xargs aptitude install -y

      FONTS_PATH="${HOME}/.fonts"
      # FONTS_PATH="${HOME}.local/share/fonts"
      # FONT_NAME="Hack_Regular_Nerd_Font_Complete_Mono.ttf"
      # FONT_URL='https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf'
      FONT_NAME="Liga_Hack_Regular_Nerd_Font_Complete_Mono.ttf"

      if [[ ! -n $(find ${FONTS_PATH} -iname ${FONT_NAME}) ]]; then
          echo "==> ${LBLUE}Installing Hack nerd font…${END}"
          directory "${FONTS_PATH}"
          # download ${FONT_URL} "${FONTS_PATH}/${FONT_NAME}"
          linked $(pwd)/fonts/LigaHackNerdFontMono-Regular.ttf "${FONTS_PATH}/${FONT_NAME}"
      fi

      fc-cache -vf ${FONTS_PATH}

      echo "==> ${LBLUE}Linking Konsole and Yakuake configuration…${END}"
      directory ~/.kde/share/apps/konsole
      linked $(pwd)/etc/kde/share/apps/konsole/Shell.profile ~/.kde/share/apps/konsole/Shell.profile
      linked $(pwd)/etc/kde/share/apps/konsole/Yakuake.profile ~/.kde/share/apps/konsole/Yakuake.profile

      echo "==> ${LBLUE}Installing Spotify…${END}"
      sudo snap install spotify || sudo snap refresh spotify
  fi
fi
