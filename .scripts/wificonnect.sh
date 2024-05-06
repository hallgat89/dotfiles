#!/bin/bash

#
# Based on http://www.linuxquestions.org/questions/linux-general-1/wifi-connect-script-tested-in-ubuntu-772646/
# Requires wireless-tools package
#

#INTERFACES=~/tmp/interfaces
INTERFACES=/etc/network/interfaces

#
# removing possible previous temp file
#
rm list.temp 2>/dev/null

#
# scans for wifi connections & isolates wifi AP name
#
eval list=( $(sudo iwlist scan 2>/dev/null | awk -F":" '/ESSID/{print $2}') )

#
# sets prompt
#
PS3="Choose wifi connection: "

#
# tests for number of wifi connections, exits if none
#
if [ -z "${list[0]}" ]; then
    clear
    echo "No available wifi connection"
    exit 1
fi

#
# menu of wifi connections
#
select item in "${list[@]}"; do

    #
    # sets essid as value for WIFI variable and displays information about the AP
    #
    wifi=$(echo $item)
    sudo iwlist scan 2>/dev/null | sed -n "/$wifi/, +9p" > list.temp
    echo "$(cat list.temp | sed 's/^[ \t]*//')"

    #
    # sets channel as value for CHANNEL variable
    #
    channel=$(grep Channel list.temp | sed 's/.*Channel//g')
    channel=$(echo $channel | sed 's/)//g')

    #
    # test for mode, if mode = master, sets MODE variable to managed
    #
    mode=$(grep Mode list.temp | sed 's/.*Mode://g')
    if [ "$mode" == "Master" ]; then
        mode="managed"
    else
        clear
        echo "Unsupported mode."
        exit
    fi

    #
    # tests for encryption key
    #
    key=$(grep key: list.temp | sed 's/.*key://g')
    if [ $key == "on" ]; then
        echo -n "Enter encryption key: "
        read key
    fi
        echo "wifi: $wifi"
        echo "key: $key"
        key=$(wpa_passphrase $wifi $key)
        echo $key
        key=$(echo $key | sed 's/.*psk=//g')
        echo $key
        key=$(echo $key | sed 's/ }//g')
        echo $key

    #
    # checks encryption algorithm
    #
    IE=$(grep IE: list.temp | sed 's/.*IE: //g')
    echo $IE

    #
    # backup interfaces file by date
    #
    echo "Reconfiguring interfaces and restarting network..."
    sudo cp $INTERFACES $INTERFACES.backup.$(date | sed 's/ /_/g')

    #
    # delete all wpa settings
    #
    sudo sed -i '/wpa-/d' $INTERFACES

    if [ "$IE" == "WPA Version 1" ]; then
    
        # set to dhcp
        sudo sed -i 's/iface eth1 inet manual/iface eth1 inet dhcp/' $INTERFACES
        
        #
        # add new wpa-settings with encryption
        #
        sudo sed -i -e "/dhcp/a\wpa-passphrase $key" \
                        -e "/dhcp/a\wpa-driver wext" \
                        -e "/dhcp/a\wpa-key-mgmt WPA-PSK" \
                        -e "/dhcp/a\wpa-proto WPA" \
                        -e "/dhcp/a\wpa-ssid \"$wifi\"" $INTERFACES
                        
        sudo /etc/init.d/networking restart

    else
        #
        # no encryption key, probably in coffee shop
        # sets the wireless configuration for non WPA: essid, channel and mode
        #
        
        # set to manual
        sudo sed -i 's/iface eth1 inet dhcp/iface eth1 inet manual/' $INTERFACES
        
        echo "------------------------------------------------"
        echo "Connecting to: $wifi at channel: $channel, mode: $mode"
        echo "------------------------------------------------"
        sudo iwconfig eth1 essid "$wifi" channel $channel mode $mode
        sudo dhclient
    fi
    
    exit
done