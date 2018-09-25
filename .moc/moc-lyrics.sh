#!/bin/bash

if ! type mocp >/dev/null 2>&1; then

printf "\033c"
echo ""
echo "MOC Is Not Installed!"
echo ""
echo "MOC Is An Amazing Console Audio Player!"
echo "Please Install MOC Using Your Package-manager!"
echo ""

exit 1

else

MOCSTATE=$(pgrep mocp)

if [[ -z "$MOCSTATE" ]]; then

printf "\033c"
echo ""
echo "MOC Is Not Running!"
echo "To Start MOC, type \"mocp\" In Your Terminal!"
echo ""

exit 1

else

SONGTITLE=$(mocp -i | grep 'SongTitle:' | sed -e 's/^.*: //');
ARTIST=$(mocp -i | grep 'Artist:' | sed -e 's/^.*: //');
ALBUM=$(mocp -i | grep 'Album:' | sed -e 's/^.*: //');

if [[ -z "$SONGTITLE" ]]; then

printf "\033c"
echo ""
echo "MOC Is Not Playing Anything!"
echo ""

exit 1

else

if ! type perl >/dev/null 2>&1; then

printf "\033c"
echo ""
echo "Perl Is Not Installed!"
echo ""
echo "Perl Is A Required Dependency!"
echo "Please Install Perl Using Your Package-manager!"
echo ""

exit 1

else

perl -MURI::Escape -e 'print "$URI::Escape::VERSION\n";' &> /dev/null

RETVAL=$?

if [ "$RETVAL" -ne 0 ]; then

printf "\033c"
echo ""
echo "Perl Module \"URI::Escape\" Is Not Installed!"
echo ""
echo "Module \"URI::Escape\" Is A Required Dependency!"
echo "Please Open The Following Link For More Info,"
echo ""
echo -e '\e[38;5;82m'"http://stackoverflow.com/q/65865"
echo ""
tput sgr0

exit 1

else

if ! type wget >/dev/null 2>&1; then

printf "\033c"
echo ""
echo "Wget Is Not Installed!"
echo "Please Install Wget Using Your Package-manager!"
echo ""

exit 1

else

if [[ `wget -S --spider "https://makeitpersonal.co" 2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then

printf "\033c"
title=$(echo "$SONGTITLE" | perl -MURI::Escape -ne 'chomp;print uri_escape($_),"\n"')
artist=$(echo "$ARTIST" | perl -MURI::Escape -ne 'chomp;print uri_escape($_),"\n"')
song=$(wget --user-agent="Mozilla/5.0 Gecko/20100101" --no-check-certificate --quiet --timeout=30 -O - "https://makeitpersonal.co/lyrics?artist=$artist&title=$title")

printf "$SONGTITLE - $ARTIST - $ALBUM\n$song" | less
printf "\033c"

exit 0

else

printf "\033c"
echo ""
echo "Can Not Connect To The Site \"makeitpersonal\"!"
echo "Make Sure Your Internet Connection Is Active!"
echo "If The Problem Persists You Can Report It At,"
echo "GitHub repository of the project by creating,"
echo "An Issue There. Here Is The Link To The Repo,"
echo ""
echo -e '\e[38;5;82m'"https://github.com/hakerdefo/moc-lyrics"
echo ""
tput sgr0
echo "If you don't use GitHub you can report it by,"
echo "emailing the author at the following address,"
echo ""
echo -e '\e[38;5;82m'"hakerdefo (at) gmail (dot) com"
echo ""
tput sgr0

exit 1

fi
fi
fi
fi
fi
fi
fi
