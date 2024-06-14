#!/bin/bash

[[ -z $1 ]] && echo "ask_feh: Bad args!" && exit
source $sh/dmenurc
pwd
dest=$( find . -maxdepth 2 -type d -printf '%P\n' | grep -v ^$ | sort | dmenuy )
[[ -z $dest ]] ||
    { mkdir -p "$dest" ; mv --backup=numbered "$1" "$dest"/ ; }

