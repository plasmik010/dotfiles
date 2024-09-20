#!/bin/bash
# Convert music files. Multithreaded to N threads!

[ -z $Nthr ] && Nthr=8
[ -z $CODEC ] && CODEC=flac
TMPF=/ln/ho/tmpfifo
DEST=/ln/fast/_dont_care_/enc
DEST_2=/ln/fast/_dont_care_/enc_$CODEC
ERRLOG=/tmp/enc.$CODEC.errors.log

CONV="conv_any2$CODEC.sh"

type -f &>/dev/null $CONV || { echo "Not familiar codec! Exiting.."; exit; }

rm $ERRLOG &>/dev/null
rm $TMPF &>/dev/null
mkfifo $TMPF # creating named pipe

[[ -d $DEST ]] || { echo "Please create $DEST manually"; exit; }

rm -rf "$DEST"/*
time (
counter=0
progres=0

function conv {
    # echo at $1
    # echo star $*
    # dirname=${1##*/}
    dirname="$(cd "$1" && realpath  . --relative-to="$(dirname "$(realpath .)")")"
    # dirname=$(realpath "$1" --relative-to="$(dirname "$1")")
    # echo "$dirname"
    output=$($CONV "$1" "$DEST" 2>&1)
    exit_code=$?
    echo $exit_code exc @ "$dirname"

    if [[ ! $exit_code -eq 0 ]]; then
        echo "$output" >> $ERRLOG
    fi
    echo 'done' > $TMPF
}

cat /ln/ho/.mus-favourites | while read podgon; do
let $[progres++];
notify-send "progr is $progres in $counter" -t 600
if [ $counter -lt $Nthr ]; then # we are under the limit
    # { $CONV "$podgon" "$DEST"; echo 'done' > $TMPF; } &
    { conv "$podgon"; } &
    let $[counter++];
else
    read x < $TMPF # waiting for a process to finish
    { conv "$podgon"; } &
    # { $CONV "$podgon" "$DEST"; echo 'done' > $TMPF; } &
fi
done
# i=i%${Nthr}; ((i++==0)) && wait -n

cat $TMPF > /dev/null # let all the background processes end
rm $TMPF # remove fifo
)

touch "$DEST"/.nomedia
co=0
MAXWAIT=70
echo -e "\nWill wait up to $MAXWAIT sec.."
SELFPCNT=8
while ( [[ $SELFPCNT -gt 2 ]] && [[ $co -lt $MAXWAIT ]] ); do
    sleep 1
    ((co=co+1))
    SELFPCNT=$(pgrep -x mt_conv.sh | wc -l)
    echo self proc cnt is $SELFPCNT
done
echo -e "Have been waiting $co seconds\n"
WETRUN=1 renam.sh "$DEST"

if [[ -d $DEST_2 ]]; then
    echo "Will rsync $DEST to $DEST_2"
    RSYNC_OPTS="-rtl --progress --delete --stats --size-only"
    rsync $RSYNC_OPTS --exclude .stfolder "$DEST/" "$DEST_2"
    # && rm -rf "$DEST"/*
fi

