#!/bin/bash

# enable firewall, allow connections wrom local network
sudo ufw enable
sudo ufw allow from 192.168.0.0/24

#synergy
#sudo ufw allow from 192.168.0.0/24 to any port 24800
#sudo ufw allow ssh

# hide my home folder
chmod 750 "$HOME"


