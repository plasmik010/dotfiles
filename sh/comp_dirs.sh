#!/bin/bash
# Compare 1-depth content of two dirs and move all mutual elements into a subdir named "00__common"

if [[ $# -ne 2 ]]; then
    echo "Please provide two paths"
    exit 1
fi

COMON="00__common"

path_A=$(realpath "$1")
path_B=$(realpath "$2")
old_pwd=$(realpath .)

errcnt=0
if [[ -d $path_A/$COMON ]] && ! [[ -z "$( ls -A $path_A/$COMON )" ]]; then
    echo "Please move $COMON/ from $path_A to avoid collisions!!"
fi
if [[ -d $path_B/$COMON ]] && ! [[ -z "$( ls -A $path_B/$COMON )" ]]; then
    echo "Please move $COMON/ from $path_B to avoid collisions!!"
fi
[[ errcnt -ne 0 ]] && exit 1

errcnt=0
mkdir -p $path_A/$COMON || ((errcnt++))
mkdir -p $path_B/$COMON || ((errcnt++))
[[ errcnt -ne 0 ]] && ( echo "unable to write to disk. gonna exit!!" ; exit 1 )

cd $path_A
com_cnt=0
for f in */ ; do 
    if [[ -d $f ]] && [[ -d $path_B/$f ]]; then
        # echo "match dir " "$f"
        ((com_cnt++));
    fi
done

echo "$com_cnt dirs are mutually present "



