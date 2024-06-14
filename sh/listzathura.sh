#!/bin/bash
# Choose from pdf and djvu files with dmenu. Then view it with zathura

source $sh/dmenurc
dirlist="/ln/hh /ln/mob/use /ln/dwn $HOME/.cache/luakit/viewpdf/ /ln/wo"
targ=$(
( find -L /ln/ho -maxdepth 1 -type f \( -iname "*.pdf" -or -iname "*.djvu" \)
find -L $dirlist -type f \( -iname "*.pdf" -or -iname "*.djvu" \) ) | \
    dmenuy
)

if [ -n "$targ" ] ; then
    zathura "$targ" &
fi

