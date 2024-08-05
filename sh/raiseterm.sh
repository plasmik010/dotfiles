#!/bin/bash
# Cycle through terminal windows

echo '.'
activeid=$(xprop -root _NET_ACTIVE_WINDOW | cut -d "#" -f2 | cut -c 4-) &&
# drop '0x0'
activeid=$(echo $activeid | cut -d ',' -f1)
# zero pad it
while [ ${#activeid} -lt 7 ]; do activeid=0$activeid; done
echo activeid is $activeid
wname="xterm\| urxvt \| kitty"
# case $TERMINAL in
#   kitty)
#     app=kitty;;
#   *)
#     app=xterm;;
# esac
exclude="-E VIM$|nvim.$|VIMSERV|VIFM$|htop$|btop$|MPV|transmission-remote|tremc|rtorrent$"

#If window of that name is active, there are others of that name, current is not last in list
if
    [[ $(wmctrl -l -x | grep -v $exclude | grep "$wname" | grep $activeid) ]] &&
    [[ $(wmctrl -l -x | grep -v -e "^...........-" | grep -v $exclude | grep "$wname" | wc -l) > 1 ]] &&
    [[ $(wmctrl -l -x | grep -v $exclude | grep "$wname" | grep -A1 $activeid | wc -l) > 1 ]]
then
    #Need to choose next terminal of same name
    echo "choosing next"
    str=$(wmctrl -l -x | grep -v -e "^...........-" | grep -v $exclude | grep "$wname" | grep -A1 $activeid | tail -1 | cut -c -10)
else
    str=$(wmctrl -l -x | grep -v -e "^...........-" | grep -v $exclude | grep -m 1 "$wname" | cut -c -10)
fi

echo Final aim $str
if [ -z "$str" ]
    then
        # Run
        # $TERMINAL &> /dev/null &
        # notify-send new_TERMINAL
        notify-send "Terminal windows not found"
    else
        # Raise
        wmctrl -i -a $str
fi

