#!/bin/bash
# List lists with dmenu

source $sh/dmenurc

data="\
Zathura:listzathura.sh\n\
FBReader:listfictionbook.sh\n\
Abiword:listabiword.sh\n\
Downloads:listdwn.sh\n\
mpv Favs:listalbums.sh /ln/ho/.mus-favourites\n\
mpv Playlist:listalbums.sh /ln/ho/.mus-playlist\n\
mpv Library:listalbums.sh\n\
mpv History:listalbums.sh /ln/ho/.mus-history\n\
Games:listgames.sh\n\
DeadBeef:listdeadbeef.sh\n\
"

echo -ne "$data" | while read line ; do
    NAME=$(echo $line | cut -d ':' -f1)
    echo $NAME
done |
dmenuy |
{ read SEL
    if [[ -z $SEL ]] ; then exit ; fi
    CMD=$(echo -ne "$data" | grep "$SEL" | cut -d ':' -f2)
    $CMD &
}

