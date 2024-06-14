#!/bin/bash
# Ask what to do/play next in target directory

clear
echo What would you like to do next?
echo

QUIT_KEY='q'
FM_KEY='c'
GOLIB_KEY='m'
GOPLIST_KEY='l'
GOHIST_KEY='i'
GOFAV_KEY='f'
PLADD_KEY='a'
PLDEL_KEY='x'
FAVADD_KEY='s'
FAVDEL_KEY='d'

# Prefer $1 for TARG
if [[ -n $1 ]]; then
    TARG="$1"
fi

# We want directory, not file
[[ -e $TARG ]] && [[ -f $TARG ]] && TARG=$(dirname "$TARG")

# If TARG not provided, use PWD
[[ -z $TARG ]] && TARG=$(pwd)

[[ -z $ONCE ]] && ONCE=0

if ! [[ -d $TARG ]]; then
    echo "(non-existent)" "$TARG" @ $(realpath .)
    TARGREAL=
else
    echo "$TARG"
    echo @ $(realpath .)
    TARGREAL=$(realpath "$TARG")
    echo "really" "$TARGREAL"
    echo ----------------------
fi

[[ -z $LIBRARY ]] && LIBRARY=$HOME/.mus-library
[[ -z $FAVS ]] && FAVS=$HOME/.mus-favourites
[[ $LIST == $LIBRARY || $LIST == $FAVS || -z $LIST ]] &&
    LIST=$HOME/.mus-playlist
HIST=$HOME/.mus-history

if [[ "$TARG" =~ "torrents/red/" ]]; then
    [[ . -nt /ln/torrents/red/KKK ]] && echo -- it is a new torrent
    [[ . -ot /ln/torrents/red/KKK ]] && echo -- it is an archive torrent
fi

if [[ ! -z $TARGREAL ]]; then
    if [[ $( grep -F -c "$TARGREAL" "$FAVS" ) -gt 0 ]]; then
        echo -- it is in Favourites
        INFAVS=1
    else
        INFAVS=0
    fi
else
    if [[ $( grep -F -c "$TARG" "$FAVS" ) -gt 0 ]]; then
        echo -- it FORMALLY is in Favourites
        INFAVS=1
    else
        INFAVS=0
    fi
fi

if [[ ! -z $TARGREAL ]]; then
    if [[ $( grep -F -c "$TARGREAL" "$LIST" ) -gt 0 ]]; then
        echo -- it is in Playlist
        INPLIST=1
    else
        INPLIST=0
    fi
else
    if [[ $( grep -F -c "$TARG" "$LIST" ) -gt 0 ]]; then
        echo -- it FORMALLY is in Playlist
        INPLIST=1
    else
        INPLIST=0
    fi
fi
echo

[[ $INVIFM == 1 ]] && \
    echo "$QUIT_KEY" - back to vifm || \
    echo "$QUIT_KEY - quit"
[[ $INVIFM != 1 ]] && \
    echo "$FM_KEY - inspect directory with Vifm"
[[ $INPLIST == 1 ]] && \
    echo "$PLDEL_KEY - Delete from Playlist"
[[ $INPLIST == 0 && ! -z $TARGREAL ]] && \
    echo "$PLADD_KEY - Add to Playlist"
[[ $INFAVS == 0 && ! -z $TARGREAL ]] && \
    echo "$FAVADD_KEY - Save to Favourites"
[[ $INFAVS == 1 ]] && \
    echo "$FAVDEL_KEY - Delete from Favourites"
[[ -f $LIST && $INVIFM != 1 ]] && \
    echo "$GOPLIST_KEY - play an album from Playlist"
[[ $INVIFM != 1 ]] && \
echo "$GOFAV_KEY - play an album from Favourites"
[[ $INVIFM != 1 ]] && \
echo "$GOHIST_KEY - play an album from History"
[[ $INVIFM != 1 ]] && \
echo "$GOLIB_KEY - play an album from Library"
echo "<Space> or <CR> - PLAY again"
echo

read -rs -n1 -p "hit some key.." prompt
# read -rsp $'hit some key\n' -n1 prompt
echo

SELECTOR=dmenuy
SELECTOR="fzf --exact --layout=reverse --keep-right --height 99%"
clear

source $sh/dmenurc
if [[ $prompt == "q" ]]; then
    exit
elif [[ $INPLIST != 1 && $prompt == "a" ]]; then
    echo "$TARGREAL" >> "$LIST"
    echo $TARGREAL  saved to Playlist.
    sleep .4
    RUNAGAIN=1
elif [[ $INPLIST == 1 && $prompt == "d" ]]; then
    # if [[ $( grep -F -c "$TARG" "$FAVS" ) -gt 0 ]]; then
    echo deleting  $TARG  from Playlist
    grep -vF "$TARG" "$LIST" > /tmp/tmplist && mv /tmp/tmplist "$LIST"
    if [[ $TARG != $TARGREAL ]]; then
        echo deleting  $TARGREAL  from Playlist
        grep -vF "$TARGREAL" "$LIST" > /tmp/tmplist && mv /tmp/tmplist "$LIST"
    fi
    sleep 1
    RUNAGAIN=1
elif [[ $INFAVS == 1 && $prompt == "S" ]]; then
    echo deleting  $TARG  from Favourites
    grep -vF "$TARG" "$FAVS" > /tmp/tmplist && mv /tmp/tmplist "$FAVS"
    if [[ $TARG != $TARGREAL ]]; then
        echo deleting  $TARGREAL  from Playlist
        grep -vF "$TARGREAL" "$FAVS" > /tmp/tmplist && mv /tmp/tmplist "$FAVS"
    fi
    sleep 1
    RUNAGAIN=1
elif [[ $INFAVS == 0 && $prompt == "s" ]]; then
    echo "$TARGREAL" >> "$FAVS"
    echo $TARGREAL  saved to Favourites.
    sleep .4
    RUNAGAIN=1
elif [[ $prompt == "c" && $INVIFM != 1 ]]; then
    vifm "$TARGREAL" -c "wincmd o"
elif [[ $prompt == "" ]]; then
    PAUSE=0 mpv-album.sh "$TARGREAL"
    # ask_album.sh
elif [[ -f $LIST ]] && [[ $prompt == "$GOPLIST_KEY" ]]; then
    SELECT=$( cat -n "$LIST" | sort -n | sort -uk2 | sort -nr | cut -f2- | $SELECTOR )
    ASK=1 PAUSE=1 mpv-album.sh "$SELECT"
elif [[ -f $LIST ]] && [[ $prompt == "$GOFAV_KEY" ]]; then
    SELECT=$( cat -n "$FAVS" | sort -n | sort -uk2 | sort -nr | cut -f2- | $SELECTOR )
    ASK=1 PAUSE=1 mpv-album.sh "$SELECT"
elif [[ -f $LIBRARY ]] && [[ $prompt == "$GOLIB_KEY" ]]; then
    # notify-send "lib is $LIBRARY"
    SELECT=$( cat "$LIBRARY" | sort -R | $SELECTOR )
    ASK=1 PAUSE=1 mpv-album.sh "$SELECT"
elif [[ -f $HIST ]] && [[ $prompt == "$GOHIST_KEY" ]]; then
    SELECT=$( cat -n "$HIST" | sort -n | sort -uk2 | sort -nr | cut -f2- | $SELECTOR )
    ASK=1 PAUSE=1 mpv-album.sh "$SELECT"
else
    clear
    echo pwd is $(pwd)
    echo
    echo Will exit in a second..
    sleep 0.4
    exit
fi

if [[ $RUNAGAIN == 1 && $ONCE != 1 ]]; then
    ask_album.sh
else
    echo "Exiting!"
    exit
fi

echo "Exiting!"
exit

