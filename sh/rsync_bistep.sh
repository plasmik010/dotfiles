#!/bin/bash
# rsync dry run, ask and wet run

if [[ -z $1 || -z $2 ]] ; then
    echo "Usage: rsync_bistep.sh input/dir output/dir"
    exit
fi
SRC="$1"
DEST="$2"

RSYNC_OPTS="-rtl --progress --delete --stats --size-only --exclude _dont_care_ "
RSYNC_OPTS="-rtL --progress --delete --stats --size-only --exclude _dont_care_ "

echo -ne "\n\n========== dry-run\n"
rsync -n $RSYNC_OPTS "$SRC/" "$DEST"

read -n 1 -s -r -p "Press F or ENTER or SPACE to sync, ESC to cancel" key

[[ "$key" == 'f' || "$key" == '' ]] &&
    (
    echo -ne "\n\n========== real\n"
    time rsync $RSYNC_OPTS "$SRC/" "$DEST"
    # read -n 1 -s -r -p "========== DONE!"
    echo "========== DONE!"
    )
echo

