#!/bin/bash

file=~/bands.txt
song="$(mocp -Q '%artist %title')"
duplicate=`cat "$file" | grep -c "$song"`

if [ "$duplicate" -eq "0" ]
then
    echo "$song" >>  "$file"
    notify-send "Song saved to $file"
else
    notify-send "Duplicate song."
fi
