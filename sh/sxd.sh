#!/bin/bash
# Reload sxhkd silently
# And invoke useful stuff

killall sxhkd; sxhkd -c  $dotfiles/conf/sxhkdrc 1>/dev/null &

addlayout.sh
xinputupd.sh
xset r rate 220 30 # set keyboard repeat rate

notify-send "$( LC_ALL=ru_RU.UTF-8 date; uptime -p )"
# notify-send TERMINAL "$TERMINAL" #debug

