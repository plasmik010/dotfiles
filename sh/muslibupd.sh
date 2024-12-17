#!/bin/bash
# Save list of music albums in my music folders. Show brief report.

muslibrary=$HOME/.mus-library
rm $muslibrary

PATH_NEW="/ln/torrents /ln/dwn /ln/mus/0new"
PATH_FAM="/ln/mus"

# "find -P" ignores symlinks
function find_albums {
    find -P $(realpath $* | sort | uniq) -type f \( -name "*.flac" -or -name "*.mp3" -or -name "*.ogg" -or -name "*.wv" -or -name "*.ape" -or -name "*.wma" \) -printf "%h\n" | sort -u > $muslibrary
}
# realpath $PATH_NEW $PATH_MOST | sort | uniq

find_albums $PATH_NEW
cnt1=$(wc -l $muslibrary | cut -d " " -f1)

find_albums $PATH_NEW $PATH_FAM
cnt3=$(wc -l $muslibrary | cut -d " " -f1)

HASG=false; pgrep -c Xorg &>/dev/null && HASG=true

# cnt3=$((cnt1+cnt2))

SUMMARY=".:. NEW $cnt1 .:. SUM $cnt3 .:."

[ $HASG == true ] && notify-send "$SUMMARY"
echo "$SUMMARY"

