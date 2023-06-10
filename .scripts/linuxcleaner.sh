#!/bin/sh

# make HOME folder private just in case
#chmod 750 "$HOME"

# remove recently used files from pcmanfm
#echo "" > ~/.local/share/recently-used.xbel

# remove Thumb.db files
#find ~ -name 'Thumbs.db' -type f -delete

# remove DS_Store files
#find ~ -name '.DS_Store' -type f -delete

#clean thumbnails
#rm -rf ~/.thumbnails

#empty trash
rm -rf ~/.local/share/Trash/files/*

#remove bash history
rm ~/.bash_history

# Clean thumbnails
exec find ~/.thumbnails -type f -atime +7 -exec rm {} \; &

#remove orphaned packages +data
#sudo deborphan --guess-data | xargs sudo apt-get -y remove --purge

#remove unnecessary packages
#sudo apt autoremove --purge $(deborphan)

#remove other unneeded packages
sudo apt clean
sudo apt autoremove

#purge unneeded configuration files
sudo dpkg --purge $(COLUMNS=200 dpkg -l | grep "^rc" | tr -s ' ' | cut -d ' ' -f 2) 2>/dev/null


