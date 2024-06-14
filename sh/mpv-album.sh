#!/bin/bash
# This is how I listen to music albums with mpv
# Usage: mpv-album.sh /path/dir DESIRED-TERMINAL-TITLE

HIST="$HOME/.mus-history"
# Ignore '..' target
[[ $1 == '..' ]] && set -- "." "${2}"
# Treat no arg situation
[[ -z $1 ]]      && set -- "." "${2}"
clear

export TARG="$1"
# Check if target (directory) is readable
if [[ -n $TARG ]] ; then
    if [[ -e $TARG ]] ; then
        [[ -f $TARG ]] && TARG=$(dirname "$TARG") # assign directory, not file
        TARGREAL=$(realpath "$TARG")
        echo "$TARG" @ $(realpath .)
        export TARG
    else
        echo mpv-album.sh says !No such directory!
        read -rs -n1 -p "hit any key.."
        [[ $ASK == 1 ]] && ask_album.sh ; exit
    fi
fi
echo

# Conditionally update history list
VERY_RECENT_THR=8
if ! [[ -f $HIST ]] ; then touch "$HIST" ; fi
recent=$( tail $HIST -n100 | cat -n | sort -nr | sort -uk2 | sort -nr | head -n $VERY_RECENT_THR | cut -f2- )
fresh=$( echo "$recent" | grep -xF "$TARGREAL" >/dev/null; echo $? )
case $fresh in
    0)
        echo This album has been played recently..
        ;;
    1)
        echo Updating history file..
        echo "$TARGREAL" >> "$HIST"
        ;;
esac

# set terminal title
if [[ -n $2 ]] ; then
    echo -ne "\033]0;MPV @ $PWD @ $2\007"
else
    echo -ne "\033]0;MPV @ $PWD\007"
fi

if [[ $PAUSE == 0 ]] ; then
    PAUSE=''
else
    PAUSE='--pause'
fi

shopt -s nullglob
shopt -s nocaseglob

if [[ $(ls "$TARG" | grep -ic '\.ape$\|\.flac$\|\.wv$') == $(ls "$TARG" | grep -ic '\.cue$') && \
            $(ls "$TARG" | grep -ic '\.cue$') > 0 ]] ; then
    echo ==play cue with mpv==
    mpv $PAUSE --no-video "$TARG"/*.cue
else
    echo ==play audio files==
    mpv $PAUSE --no-video "$TARG"/*.{flac,mp3,ogg,ape,wv}
fi
[[ $ASK == 1 ]] && ask_album.sh


