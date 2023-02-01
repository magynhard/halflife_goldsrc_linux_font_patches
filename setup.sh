#!/usr/bin/env bash

echo
echo "#########################################"
echo "## Half-Life GoldSrc Linux Font Patches"
echo "#########################################"
echo

if [[ "$EUID" = 0 ]]; then
    echo "(1) already root"
else
    sudo -k # make sure to ask for password on next sudo
    if sudo true; then
        echo "(2) correct password"
    else
        echo "(3) wrong password"
        exit 1
    fi
fi

ruby setup.rb

