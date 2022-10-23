#!/bin/bash

# This is a random token to prevent double Install in your .bashrc
RNDTOKEN='eet3hee1bei4oavie5Eeceew15i9emumu'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FILENAME='smartprompt.txt'
FULLPATH=`readlink -f $DIR/$FILENAME`
TOKENEXISTS=`cat ~/.bashrc | grep "$RNDTOKEN" | wc -l`

if [ "$TOKENEXISTS" -eq "0" ]
then
	echo "###### Do not delete this token: $RNDTOKEN ######" >> ~/.bashrc
	cat $FULLPATH >> ~/.bashrc
else
	echo "Smart prompt already installed"
	exit 1
fi
exit 0
