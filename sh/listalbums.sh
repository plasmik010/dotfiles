#!/bin/bash
# Select music album with dmenu and play it with mpv

if [[ -z $1 ]] ; then
    set -- "$HOME/.mus-library"
    echo "No list file provided. Will use default library file"
fi

source $sh/dmenurc

# Remove duplicates and choose line with dmenu
if [[ $SHFL -gt 0 ]] ; then
    # Shuffle
    SEL=$( cat "$1" | sort -R | dmenuy )
else
    # Remove Duplicates
    SEL=$( cat -n "$1" | sort -nr | sort -uk2 | sort -nr | cut -f2- | dmenuy $DMENU_OPTIONS -fn "$DMENU_FN" )
fi

# export LIST="$1"
PLAYER_CMD="ASK=1 mpv-album.sh"

# Construct command to call new terminal window
case $TERMINAL in
kitty*)
    NEW_TERMINAL="$TERMINAL -o initial_window_height=$(expr 450 + $HIDPI \* 240) -o initial_window_width=$(expr 650 + $HIDPI \* 250) /bin/bash -c"
    ;;
*)
    NEW_TERMINAL="xterm -xrm 'XTerm.vt100.allowTitleOps:true' -geometry 60x24+400+250 -e"
    # xterm -xrm 'XTerm.vt100.allowTitleOps: false' -T "$l - MPV" -geometry 60x24+400+250 -e mpv --pause --no-video . &> /dev/null &
    ;;
esac


case $(echo "$SEL" | grep -v ^$ | wc -l) in
0)
    echo Nothing selected!
    ;;
1)
    BASH_CMD="$PLAYER_CMD \"$SEL\""
    exec $NEW_TERMINAL "$BASH_CMD" &
    ;;
*)
    echo "$SEL" | \
        while read l ; do
            BASH_CMD="$PLAYER_CMD \"$l\""
            exec $NEW_TERMINAL "$BASH_CMD" &
        done
    ;;
esac

