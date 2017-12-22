#!/bin/bash

BASEDIR=$(dirname "$0")
files=($BASEDIR/ascii/)
randomfile=`ls $files | grep ".ascii" | shuf | head -1`

echo -e "\e[93m"
cat $files$randomfile
echo -e "\e[0m"
