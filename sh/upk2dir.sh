#!/bin/bash

[ -z "$APPEND" ] ||
    APPEND="_D"

echo upk2dir:
echo args are $*

if [ -z "$1" ] || [ -n "$3" ] || [ -d "$1" ] || [ -f "$2" ]; then
    echo Usage: upk2dir.sh archive.file [OUTDIR]
    exit 1
fi

wd=${PWD}
curdirname=${PWD##*/}
arcname=$(basename "$1")
fullarcname=$(realpath "$1")

if [[ "$2" ]] ; then
    dest="$2/$arcname$APPEND"
    echo --Will extract to $dest
    mkdir -p "$dest" || { echo Destination unavailable.; exit 1; }
else
    dest="$arcname$APPEND"
    echo --Will extract to $dest
    mkdir -p "$dest"
fi

# mv "$1" "$dest"
cd "$dest"
upk.sh "$fullarcname" || { echo Unpacking encountered problems.; exit 1; }

if [ "$curdirname" != ".del" ] ; then
    cd "$wd" && [ -d ".del" ] && mv "$1" .del/"$1"
fi

