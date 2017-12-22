#!/bin/sh


DSTAT=`dropbox status | grep "^Up to date" | wc -l`
DRUN=`ps -A | grep dropbox | wc -l`

#close always
while [ "1" -gt "0" ]
do

DSTAT=`dropbox status | grep "^Up to date" | wc -l`

if [ "$DSTAT" -gt "0" ]
then
    dropbox stop &
    notify-send "Dropbox Closed"
fi

sleep 100

DRUN=`ps -A | grep dropbox | wc -l`

done
exit 0
