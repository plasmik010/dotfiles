#!/bin/bash
# Convert lossless music folder to flac format, just do copy in case of mp3 or ogg
# Usage: conv_any2flac.sh target_dir

if [ -z "$1" ]; then set -- "." "${2}"; fi
if [ -z "$2" ]; then set -- "${1}" "."; fi

mkdir -p "$2"
dest=$(realpath "$2")
src="$1"
cd "$src"
exit_code=-1

drn=${PWD##*/}
f=$(ls | grep -c '\.flac$')
c=$(ls | grep -c '\.cue$')
w=$(ls | grep -c '\.wav$')
m=$(ls | grep -c '\.mp3$')
v=$(ls | grep -c '\.ogg$')
a=$(ls | grep -c '\.ape$')
# echo f c m w $f $c $m $w

echo "--now @ $src"

if [ $a -gt 0 ]; then
    echo "Warning! Ape format is not supported."
fi

if [ $m -gt 0 ]; then
    echo "  --Copy all mp3's"
    mkdir -p "$dest/$drn"
    for f in *.mp3; do
        cp "$f" "$dest/$drn/"
    done
    cp 2>/dev/null *[C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$dest/$drn/"
    exit_code=0
elif [ $v -gt 0 ]; then
    echo "  --Copy all ogg's"
    mkdir -p "$dest/$drn"
    for f in *.ogg; do
        cp "$f" "$dest/$drn/"
    done
    cp 2>/dev/null *[C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$dest/$drn/"
    exit_code=0
elif  [ $f -gt $c ]; then
    echo "  --Copy all flacs"
    mkdir -p "$dest/$drn"
    for f in *.flac; do
        cp "$f" "$dest/$drn/"
    done
    cp 2>/dev/null *[C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$dest/$drn/"
    exit_code=0
elif [ $c -gt 0 ] && [ $w -eq 0 ]; then
    echo "  --Convert cue to flac"
    out=$(conv_cue2flac.sh . "$dest" 2>&1)
    exit_code=$?
    [[ ! exit_code -eq 0 ]] && echo $out
elif [ $w -gt 0 ] && [ $w -gt $c ]; then
    echo "  --Convert wavs to flac"
    mkdir -p "$dest/$drn"
    exit_code=0
    for f in *.wav; do
        out=$(flac "$f" --output-prefix "$dest/$drn/")
        exc=$?
        ((exit_code+=exc))
    done
    cp 2>/dev/null *[C,c]over.* [F,f]ront.* [F,f]older.* [B,b]ack.* "$dest/$drn/"
else
    echo !! Cant decide how convert music at $src
    exit 1
fi

exit $exit_code

