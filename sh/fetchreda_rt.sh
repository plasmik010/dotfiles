#!/bin/bash

source $sh/dmenurc
list=$( ls /ln/dwn/*.torrent | dmenuy )
echo $list
[[ -n list ]] && mv "$list" /ln/ho/.rtorrent/watch/red/

    # transmission-remote 9090 -a -w /ln/torrents/red "$f" && sleep 0.5 && mv "$f" /ln/torrents/red/.torrents-new/

