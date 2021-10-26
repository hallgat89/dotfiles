#!/bin/sh

file=`cat ~/.config/nitrogen/bg-saved.cfg | grep file | head -n 1 | cut -d= -f2`
mode=`cat ~/.config/nitrogen/bg-saved.cfg | grep mode | head -n 1 | cut -d= -f2`
color=`cat ~/.config/nitrogen/bg-saved.cfg | grep bgcolor | head -n 1 | cut -d= -f2`

case $mode in
    0)
    mode=scaled
    ;;
    1)
    mode=tile
    ;;
    2)
    mode=center
    ;;
    3)
    #zoomed
    mode=fit
    ;;
    4)
    #automatic
    mode=center
    ;;
    5)
    #zoomed fill
    mode=fill
    ;;
esac

echo $file
echo $mode
echo $color

swaybg -i "$file" -m "$mode" -c "$color"
