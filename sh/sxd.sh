#!/bin/bash
# Reload sxhkd silently
# And invoke useful stuff

killall sxhkd; sxhkd -c  $dotfiles/conf/sxhkdrc 1>/dev/null &

addlayout.sh
xinputupd.sh
set_kb_rate

notify-send "$( LC_ALL=ru_RU.UTF-8 date; uptime -p )"
# notify-send TERMINAL "$TERMINAL" #debug

