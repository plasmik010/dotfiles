#!/bin/bash
# Backup using tar

mkdir -p "$bakhot"
! [[ -d $bakhot ]] && echo Error! Hot backup dir not available! && exit

DAY=$(date +%Y-%m-%d)
MON=$(date +%Y-%m)
if [[ -d $bakhot/$DAY ]] ; then
    if [[ $DONTOVERWRITE == 1 ]] ; then
        echo -e "--Backup not wanted!"
        exit
    else
        rm -rf "$bakhot/$DAY"
    fi
fi
mkdir "$bakhot/$DAY"

echo --bak.stage1
tar -czf /ln/lo/cur/linkdir.tar.gz -C / ln

[[ -d $tt ]] && conditional_line="-C $tt/../ tt"
tar -chzf "$bakhot/$DAY/words.tar.gz" \
        -C /ln/ --exclude=lo/cur sh lo \
        $conditional_line
        # -C $tt/../ tt

[[ -d /ln/torrents ]] &&
    tar -czf "$bakhot/$DAY/torrents.tar.gz" --ignore-failed-read \
        -C /ln/ho .config/transmission-daemon .rtorrent
tar -czf "$bakhot/$DAY/conf.tar.gz" --ignore-failed-read \
        -C / etc/fstab etc/udevil/udevil.conf ln/ho/.ssh ln/ho/.vim ln/co/nvim/plugged ln/co/nvim/lsp_servers

[[ -d $bakcld ]] &&
    {
        echo --bak.stage2
        mkdir -p "$bakcld/$MON"
        cp -rf "$bakhot/$DAY/"* "$bakcld/$MON"
    } ||
        { echo Warning! Cold backup dir not available! ;}

[[ -d $baksam ]] &&
    {
        echo Gonna write to SAM as well..
        mkdir -p "$baksam/${spc}_$MON"
        cp -rf "$bakhot/$DAY/"* "$baksam/${spc}_$MON"
    }

