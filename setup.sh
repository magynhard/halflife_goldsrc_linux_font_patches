#!/usr/bin/env bash

BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
PINK="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"
NORMAL="\033[0;39m"

SYM_SUCCESS=$GREEN✔$NORMAL
SYM_FAIL=$RED✘$NORMAL


echo -e
echo -e "############################################"
echo -e "## $YELLOW Half-Life GoldSrc Linux Font Patches $NORMAL"
echo -e "############################################"
echo -e "$NORMAL"
echo -e "➜ Action: $GREEN${ACTION}$NORMAL"
#
#if [[ "$EUID" = 0 ]]; then
#    echo -e "(1) already root"
#else
#    sudo -k # make sure to ask for password on next sudo
#    if sudo true; then
#        echo -e "(2) correct password"
#    else
#        echo -e "(3) wrong password"
#        exit 1
#    fi
#fi

echo -e "➜ Loading files ..."

cd /tmp
rm -rf hl_font_patches
mkdir hl_font_patches
cd hl_font_patches

curl -sS https://raw.githubusercontent.com/magynhard/halflife_goldsrc_linux_font_patches/master/fonts/Retro%20Gaming.ttf -o RetroGaming.ttf
curl -sS https://raw.githubusercontent.com/magynhard/halflife_goldsrc_linux_font_patches/master/cstrike/resource/TrackerScheme.res -o TrackerScheme.res.cstrike
curl -sS https://raw.githubusercontent.com/magynhard/halflife_goldsrc_linux_font_patches/master/dod/resource/TrackerScheme.res -o TrackerScheme.res.dod
echo

STEAM_PATH=~/.local/share/Steam
STEAM_PATH_CSTRIKE=${STEAM_PATH}/steamapps/common/Half-Life/cstrike
STEAM_PATH_DOD=${STEAM_PATH}/steamapps/common/Half-Life/dod

FONT_DESTINATION=/usr/share/fonts/Retro\ Gaming.ttf

CSTRIKE_DESTINATION=$STEAM_PATH_CSTRIKE/TrackerScheme.res
DOD_DESTINATION=$STEAM_PATH_DOD/TrackerScheme.res


echo -e "➜ installing font ..."
sudo rm -rf "$FONT_DESTINATION"
sudo cp ./RetroGaming.ttf "$FONT_DESTINATION"
if [ -f "$FONT_DESTINATION" ]; then
  sudo fc-cache -f
  echo -e "  $SYM_SUCCESS installed successfully"
else
  echo -e "  $SYM_FAIL error when installing"
  exit 1
fi
echo

echo -e "➜ locating Steam installation ..."
if [ -d "$STEAM_PATH" ]; then
    echo -e "  $SYM_SUCCESS Steam found at ${STEAM_PATH}"
    echo
    # CSTRIKE
    echo -e "  ➜ locating Counter-Strike 1.6 installation ..."
    if [ -d "$STEAM_PATH_CSTRIKE" ]; then
        echo -e "    $SYM_SUCCESS Counter-Strike 1.6 found at ${STEAM_PATH_CSTRIKE}"
        echo -e "    ➜ installing scheme ..."
        rm -rf $CSTRIKE_DESTINATION
        cp ./TrackerScheme.res.cstrike $CSTRIKE_DESTINATION
        if [ -f "$CSTRIKE_DESTINATION" ]; then
          echo -e "      $SYM_SUCCESS installed successfully"
        else
          echo -e "      $SYM_FAIL error when installing"
        fi
    else
        echo -e "    $SYM_FAIL Counter-Strike 1.6 not found. Skipping ..."
    fi
    echo
    # DOD
    echo -e "  ➜ locating Day of Defeat 1.2 installation ..."
    if [ -d "$STEAM_PATH_DOD" ]; then
        echo -e "    $SYM_SUCCESS Day of Defeat 1.2 found at ${STEAM_PATH_CSTRIKE}"
        echo -e "    ➜ installing scheme ..."
        rm -rf $DOD_DESTINATION
        cp ./TrackerScheme.res.cstrike $DOD_DESTINATION
        if [ -f "$DOD_DESTINATION" ]; then
          echo -e "      $SYM_SUCCESS installed successfully"
        else
          echo -e "      $SYM_FAIL error when installing"
        fi
    else
        echo -e "    $SYM_FAIL Day of Defeat 1.2 not found. Skipping ..."
    fi
else
    echo -e "  $SYM_FAIL Steam not found. Aborting ..."
    exit 1
fi

echo
echo -e "$SYM_SUCCESS Installation script finished"