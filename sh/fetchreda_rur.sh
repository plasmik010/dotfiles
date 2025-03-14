#!/bin/bash

source $sh/dmenurc
list=$( ls /ln/dwn/*.torrent | dmenuy )
echo $list
[[ -n list ]] && mv "$list" /ln/ho/rr/data/rtorrent/watch/red-new/

