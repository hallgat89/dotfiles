#!/bin/sh

#remove orphaned packages +data
sudo deborphan --guess-data | xargs sudo apt-get -y remove --purge

#remove unnecessary packages
sudo apt autoremove --purge $(deborphan)

#remove other unneeded packages
sudo apt clean
sudo apt autoremove

#purge unneeded configuration files
sudo dpkg --purge $(COLUMNS=200 dpkg -l | grep "^rc" | tr -s ' ' | cut -d ' ' -f 2) 2>/dev/null

# clean snaps
set -eu
#LANG=en_US.UTF-8 
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        sudo snap remove "$snapname" --revision="$revision"
    done;
