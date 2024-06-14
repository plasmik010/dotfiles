#!/bin/bash
# Relaunch picom

if $(type "resta" &>/dev/null) ; then
    resta "picom" "picom --config $dotfiles/conf/picom.conf"
else
    killall picom
    sleep .5
    picom --config $dotfiles/conf/picom.conf &
fi

