#!/bin/bash

function join { echo "$*"; }

BASIC='plymouth-themes lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings alsa-base grub-pc'

SETTINGS='xfce4-notifyd xfce4-power-manager xfce4-screenshooter xfce4-settings xfce4-volumed lxpolkit lubuntu-restricted-extras'

APPS='rofi feh install geany astyle pcmanfm xfce4-terminal ristretto redshift xzoom seahorse gnome-keyring libsecret-tools volumeicon-alsa xfonts-terminus usb-creator-gtk parcellite psensor lm-sensors gimp language-selector-common vlc numlockx nm-applet mcomix qpdfview qmmp qmmp-plugin-projectm  compton compton-conf'

I3WM='i3 i3lock i3blocks j4-dmenu-desktop dmenu'

OPENBOX='openbox obmenu obconf tint2 gsimplecal nitrogen plank oneko'

JWM='jwm'

TERMINAL='mc moc htop newsbeuter screenfetch ssh mutt mutt-patched urlview urlscan w3m curl wget gtkorphan lolcat dvtm'

JAPANESE='ibus ibus-anthy fonts-vlgothic fonts-takao ttf-kochi-mincho fonts-dejima-mincho fonts-horai-umefont'

DROPBOX='nautilus-dropbox'

JAVA='oracle-java8-installer oracle-java8-set-default'

FLASH='flashplugin-installer'

GIT='git'

LIBREOFFICE='libreoffice'

STEAM='steam'

SPOTIFY='spotify'

THEMES='faenza-icon-theme numix-icon-theme numix-gtk-theme adapta-gtk-theme paper-cursor-theme square-icons'

SECURITY='dnscrypt-proxy ufw clamtk'

HOTCORNER='brightside skippy-xd'

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
10 "Java" on \
11 "Flash" off \
12 "Git" off \
13 "LibreOffice" off \
14 "Steam" off \
15 "Spotify" off \
16 "Extra themes" off \
17 "Extra security" on \
18 "Hot corners" off)

response=$?
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)


if [ "$response" -eq "255" ]
then
    exit 255
fi

# Add repositories
for c in $choices
do
    case $c in 
    10)
        sudo add-apt-repository ppa:webupd8team/java
    ;;
    13)
        sudo add-apt-repository ppa:libreoffice/ppa
    ;;
    15)
        sudo add-apt-repository "deb http://repository.spotify.com stable non-free"
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
    ;;
    16)
        sudo apt-add-repository ppa:tista/adapta #adapta
        sudo add-apt-repository ppa:numix/ppa  #numix
        sudo add-apt-repository ppa:snwh/pulp #paper
        sudo add-apt-repository ppa:noobslab/icons2 #square-icons
    ;;
    *)
    esac
done
    
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
        sudo apt install $JAVA
    ;;
    11)
        sudo apt install $FLASH
    ;;
    12)
        sudo apt install $GIT
    ;;
    13)
        sudo apt install $LIBREOFFICE
    ;;
    14)
        sudo apt install $STEAM
    ;;
    15)
        sudo apt install $SPOTIFY
    ;;
    16)
        sudo apt install $THEMES
    ;;
    17)
        sudo apt install $SECURITY
    ;;
    18)
        sudo apt install $HOTCORNER
    ;;
    *)
    esac 
done
