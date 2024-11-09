#!/bin/bash
# Backup using tar

mkdir -p "$bakhot"
! [[ -d $bakhot ]] && echo Error! Hot backup dir not available! && exit 1
# mkdir -p "$bakhot"/daily

DAY=$(date +%Y-%m-%d)
WEEK=$(date +%Y_w%W)
MON=$(date +%Y-%m)
DEST_WEKLY="$bakhot/weekly/$WEEK"
DEST_DAYLY="$bakhot/daily/$DAY"
DO_WEK=true
DO_DAY=true

if [[ -d $DEST_WEKLY ]]; then
    if [[ $DONTOVERWRITE -ge 1 ]]; then
        echo -e "-- will not do Weekly backup.."
        DO_WEK=false
    else
        rm -rf "$DEST_WEKLY"
    fi
fi

if [[ -d $DEST_DAYLY ]]; then
    if [[ $DONTOVERWRITE -ge 2 ]] ; then
        echo -e "-- will not do Daily backup.."
        DO_DAY=false
    else
        rm -rf "$DEST_DAYLY"
    fi
fi

if [[ $DONTOVERWRITE -ge 2 ]] ; then
    exit 0
fi

mkdir -p "$DEST_WEKLY"
mkdir -p "$DEST_DAYLY"

[[ -d $bakhot/ffbookmarks ]] && {
    cd "$bakhot/ffbookmarks"
    latest=$(ls . -t | head -1 )
    boomname="$(echo $latest | cut  -f -2 -d '_').jsonlz4"
    cp "$latest" "/tmp/$boomname"
    cd - 1>/dev/null
}

echo --- gonna bak hot

[[ -d $tt ]] && conditional_line="-C $tt/../ tt"
[[ -n $boomname ]] && conditional_line="$conditional_line -C /tmp $boomname"
    tar -chzf "$DEST_DAYLY/words.tar.gz" --ignore-failed-read \
        -C /ln/ --exclude=lo/cur sh lo \
        $conditional_line

[[ -d /ln/torrents ]] &&
    tar -czf "$DEST_DAYLY/torrents.tar.gz" --ignore-failed-read \
        -C $HOME .config/transmission-daemon .rtorrent .rtorrent.rc

[[ -d /ln/co/nvim ]] && [[ $space == "ho" ]] &&
    tar -cf "$DEST_DAYLY/nvplugins.tar.zst" -I "zstd -10 -T0" --exclude='.git' \
        -C $git nvpl

[[ -d /ln/wo ]] && [[ $space == "wo" ]] &&
    workrp=$(realpath /ln/wo) && workbn=$(basename $workrp) &&
    tar -cf "$DEST_DAYLY/work.tar.zst" -I "zstd -10 -T0" -C $workrp/.. $workbn

tar -cf "$DEST_DAYLY/conf.tar.zst" -I "zstd -10 -T0" --ignore-failed-read \
    -C / $(cd / && ls -d etc/fstab etc/udevil/udevil.conf 2>/dev/null) \
    -C $HOME .bash_history $(cd $HOME && ls -d .ssh .git*tials .cache/dmenu-recent .vim 2>/dev/null) \
    -C /ln/co kitty kitty-themes deadbeef \
    $conditional_line

if [[ $DO_WEK == true ]]; then
    if [[ -d $DEST_WEKLY ]]; then
        cp -rf "$DEST_DAYLY/"*tar* "$DEST_WEKLY"
    else
        echo Warning! Weekly backup failed!
    fi
    if [[ -d $bakcld ]]; then
        echo --- gonna bak cold
        mkdir -p "$bakcld/${space}_$MON"
        cp -rf "$DEST_WEKLY/"*tar* "$bakcld/${space}_$MON"
    else
        echo Warning! Cold backup failed!
    fi
fi

if [[ $DO_DAY == true ]]; then
    # Remove backups, leave only 10 most fresh
    {
        cd $bakhot/daily/ && {
            list=$(ls -dt * | tail -n +11)
            [[ -n $list ]] && rm -r $list
        }
    }
fi
if [[ $DO_WEK == true ]]; then
    {
        cd $bakhot/weekly/ && {
            list=$(ls -dt * | tail -n +16)
            [[ -n $list ]] && rm -r $list
        }
    }
fi

devlabel=$( $LSBLK -l -o LABEL | grep "AMV" | sort | head -1 )
[[ $devlabel != '' ]] && bakdev=$( $LSBLK -l -o NAME,LABEL | grep $devlabel | head -1 | cut -f1 -d ' ' )

if [[ $bakdev != '' ]]; then
    echo --- gonna bak to $devlabel
    flowctrl=true
    if [[ $( mount | grep $devlabel | grep $bakdev -c ) == 0 ]]; then
        echo --- mounting $devlabel ..
        udevil mount /dev/$bakdev /ln/mo/$devlabel || flowctrl=false
        need_umount=true
    fi
    bakusbdir=$(compgen -G /ln/mo/*AMV/bak)
    echo bakusbdir $bakusbdir
    if [[ $flowctrl == true && -d $bakusbdir ]]; then
        devlabel=$(echo $bakusbdir | tr / \\n | grep AMV)
        mkdir -p "$bakusbdir/${space}_$MON"
        cp -rf "$DEST_WEKLY/"*tar* "$bakusbdir/${space}_$MON"
    else
        echo Warning! Port backup failed!
    fi
    echo --- wait $devlabel for to sync
    sync /ln/mo/$devlabel || flowctrl=false
    if [[ $flowctrl == true && $need_umount == true ]]; then
        echo --- unmounting $devlabel ..
        udevil umount /ln/mo/$devlabel
    fi
    # echo bak port Done!
fi

# vim: sw=4:ts=4:sts=4
