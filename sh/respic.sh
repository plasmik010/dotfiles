#!/bin/bash
# Resize all images in dir to half and compress to jpg with imagemagick

[ -z "$1" ] && set -- "50%"

cnt=$(find . -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.tif' | wc -l)
if [ $cnt -eq 0 ]; then
    echo "!! No pic files in $PWD"
    exit 1
fi

mkdir -p respic

if [ $1 == "100%" ]; then
    res_opt=""
    echo "Not gonna resize."
else
    res_opt="-resize $1"
fi
# echo resopt $res_opt

{
shopt -s nullglob # Sets nullglob
shopt -s nocaseglob # Sets nocaseglob

for fi in *.{png,jpg,jpeg,tif}; do
    case "$fi" in
        *".png"  ) fo=${fi%.png}.jpg;;
        *".jpg"  ) fo="$fi";;
        *".tif"  ) fo="$fi".jpg;;
        *".jpeg" ) fo=${fi%.jpeg}.jpg;;
    esac
    magick "$fi" $res_opt -sampling-factor 4:2:0  -quality 95%  jpg:respic/"$fo";
done
}

# for f in *.jpg; do
#     magick "$f" -resize "$1" -sampling-factor 4:2:0  -quality 95%  jpg:respic/"$f";
# done

