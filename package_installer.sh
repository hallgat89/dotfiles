#!/bin/bash

function join { echo "$*"; }

BASIC='plymouth-themes lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings alsa-base grub-pc'

SETTINGS='xfce4-notifyd xfce4-power-manager xfce4-screenshooter xfce4-settings xfce4-volumed lxpolkit lubuntu-restricted-extras'

APPS='rofi feh install geany astyle pcmanfm sakura nomacs redshift xzoom seahorse gnome-keyring libsecret-tools pnmixer xfonts-terminus usb-creator-gtk parcellite psensor lm-sensors gimp language-selector-common vlc numlockx nm-applet mcomix qpdfview qmmp qmmp-plugin-projectm nitrogen compton compton-conf'

I3WM='i3 i3lock i3blocks j4-dmenu-desktop dmenu'

OPENBOX='openbox obmenu obconf tint2 gsimplecal'

JWM='jwm'

TERMINAL='mc moc htop newsbeuter ssh mutt urlview urlscan w3m curl wget gtkorphan lolcat dvtm'

JAPANESE='ibus ibus-anthy fonts-vlgothic fonts-takao ttf-kochi-mincho fonts-dejima-mincho fonts-horai-umefont'

DROPBOX='nautilus-dropbox'

FLASH='flashplugin-installer'

GIT='git'

LIBREOFFICE='libreoffice'

STEAM='steam'

SECURITY='dnscrypt-proxy ufw clamtk'


cmd=(dialog  --backtitle "Software installation" --checklist "Software groups:" 18 40 12)
options=(1 "Base system packages" on \
2 "Default setting managers" on \
3 "Default applications" on \
4 "I3wm" on \
5 "Openbox" off \
6 "JWM" off \
7 "Terminal utils" on \
8 "Japanese support" on \
9 "Dropbox" on \
10 "Flash" off \
11 "Git" off \
12 "LibreOffice" off \
13 "Steam" off \
14 "Extra security" on \

response=$?
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)


if [ "$response" -eq "255" ]
then
    exit 255
fi
    
#update
sudo apt update

echo $choices
    
for i in $choices
do
    case $i in
    1)
        sudo apt install $BASIC
    ;;
    2)
        sudo apt install $SETTINGS
    ;;
    3)
        sudo apt install $APPS
    ;;
    4)
        sudo apt install $I3WM
    ;;
    5)
        sudo apt install $OPENBOX
    ;;
    6)
        sudo apt install $JWM
    ;;
    7)
        sudo apt install $TERMINAL
    ;;
    8)
        sudo apt install $JAPANESE
    ;;
    9)
        sudo apt install $DROPBOX
    ;;
    10)
        sudo apt install $FLASH
    ;;
    11)
        sudo apt install $GIT
    ;;
    12)
        sudo apt install $LIBREOFFICE
    ;;
    13)
        sudo apt install $STEAM
    ;;
    14)
        sudo apt install $SECURITY
    ;;
    *)
    esac 
done
