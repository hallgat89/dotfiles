#!/bin/sh

# Script to change tint2 on the run $1 is the name of the config file

home="/home/"
whoami=`whoami`
rcloc="/.config/tint2/tint2rc"

basedir=$(dirname $0)


if [ "$#" -ne 1 ]; then
  echo "no parameter"
  exit 1
fi

cp -R $basedir/$1 $home$whoami$rcloc

killall tint2 
tint2 &

exit 0
