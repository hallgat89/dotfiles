#!/bin/bash

str=`mocp -Q  "%artist%song"`

if [ -n "$str" ]
then
	notify-send "`mocp -Q  "%artist - %song \n [%album]"`"
else
	notify-send "`mocp -Q "%file" | rev | cut -d'/' -f1 | rev`"
fi
