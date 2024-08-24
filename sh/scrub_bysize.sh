#!/bin/bash
# Log sha1 hashsum for every file in current location

dstmangl=$(echo "$PWD/$1" | tr -d "./ "  )
export output=/tmp/scrub_"$dstmangl"

echo Will output to $output
[[ -f "$output" ]] && rm "$output"

find -L  "$1"  -depth  -type f -not -path '*/\.git/*'  -print 1>"$output"

sort -o "$output" "$output"
du -h "$output"

echo "Gonna calc sha1 sums.."
[[ -f "$output"_sums ]] && rm "$output"_sums
cat "$output" | while read fname
do
    sum=$(sha1sum "$fname"| cut -f1 -d " ")
    size=$(du -b "$fname"| cut -f1)
    while [ ${#size} -lt 12 ]; do size=0$size; done
    echo -e "$size:$sum:$fname" >>"$output"_sums
done

mv "$output"_sums "$output"

echo "Gonna sort by size"
sort -o "$output" "$output"

du -h "$output"

