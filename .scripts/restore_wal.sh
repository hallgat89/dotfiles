#!/bin/bash
NITIMG=`cat $HOME/.config/nitrogen/bg-saved.cfg | grep "file" | tail -1 | cut -d= -f2` 
~/.scripts/wal.sh -n -i "$NITIMG"
