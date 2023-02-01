#!/usr/bin/env bash

echo
echo "#########################################"
echo "## Half-Life GoldSrc Linux Font Patches"
echo "#########################################"
echo
echo "ACTION: ${ACTION}"
#
#if [[ "$EUID" = 0 ]]; then
#    echo "(1) already root"
#else
#    sudo -k # make sure to ask for password on next sudo
#    if sudo true; then
#        echo "(2) correct password"
#    else
#        echo "(3) wrong password"
#        exit 1
#    fi
#fi

cd /tmp
mkdir hglfp
cd hglfp
curl -O https://raw.githubusercontent.com/magynhard/halflife_goldsrc_linux_font_patches/master/setup.rb

curl https://raw.githubusercontent.com/magynhard/halflife_goldsrc_linux_font_patches/master/cstrike/resource/TrackerScheme.res -o TrackerScheme.res.cstrike
curl https://raw.githubusercontent.com/magynhard/halflife_goldsrc_linux_font_patches/master/dod/resource/TrackerScheme.res -o TrackerScheme.res.dod
ruby setup.rb

