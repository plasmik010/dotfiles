#!/bin/bash
# My run-or-raise window script
# Cycle through windows of matching class/name or run something when desired windows are not present
# Dependency : wmctrl
#
# Usage: 'ror.sh classname-or-windowname [run command]'
# Example: ror.sh speedcrunch
# Example: ror.sh zathura cool-zathura-launcher.sh
# Example: breoffice.libreoffice 'notify-send Libreoffice is not running'
# Example: ror.sh ' - VIM$\| - NVIM$\|Qtreator' '$TERMINAL nvim'
# Hint: Try 'wmctrl -l -x' to discover classnames and windownames

window_list=$(wmctrl -l -x)
# window_list_nocaller=$(echo "$window_list" | grep -v -F "ror.sh $*")
window_list_nocaller=$(echo "$window_list" | grep -v -F "ror.sh $1")
# DEBUG=1
# echo -e "$window_list_nocaller \n\nror.sh $*" > /tmp/ror__debug

[[ $DEBUG == '1' ]] && echo '.' && echo "$window_list_nocaller" && echo '.' && echo "ror.sh $*" && echo '.'
activeid=$(xprop -root _NET_ACTIVE_WINDOW | cut -d "#" -f2 | cut -c 4-) &&
# drop '0x0'
activeid=$(echo $activeid | cut -d ',' -f1)
# zero pad it
while [ ${#activeid} -lt 7 ] ; do activeid=0$activeid; done
[[ $DEBUG == '1' ]] && echo "ror: activeid is $activeid"
# If classname not provided, use current window's class
if [ "$1" == '0' ] ; then
  wname=$(echo "$window_list" | grep -a $activeid | cut -d " " -f4 | cut -d "." -f1)
  echo "ror: focus another $wname"
else
  wname=$1
  # if [ -z "$1" ] ; then echo "Please, provide argument"; exit 1 ; fi
  # if [ -z "$1" ] ; then wname="543yhv89nt7u8h43q34q8gh" ; fi # to select no candidate
fi

echo wname is $wname

if [ -n "$1" ] ; then
  if
    # If window of that name is active, there are others of that name, current is not last in list
    [[ $(echo "$window_list" | grep -a "$wname" | grep -a $activeid) ]] &&
    [[ $(echo "$window_list" | grep -a -v -e "^.{9}\s" | grep -a "$wname" | wc -l) > 1 ]] &&
    [[ $(echo "$window_list" | grep -a "$wname" | grep -a -A1 $activeid | wc -l) > 1 ]]
  then
    # Choose next window of same name
    echo "ror: want next $wname window"
    target=$(echo "$window_list" | grep -a -v -e "^{9}\s" | grep -a "$wname" | grep -a -A1 $activeid | tail -1 | cut -c -10)
  else
    # Just choose window which includes desired name
    echo "ror: want any $wname window"
    target=$(echo "$window_list_nocaller" | grep -a -v -e "^{9}\s" | grep -a -m 1 "$wname" | cut -c -10)
  fi
fi

[[ $DEBUG == '1' ]] && echo Final target window id is $target
if [ -z "$target" ] ; then
  # Run
  if [ -n "$2" ] ; then
    [[ $DEBUG == '1' ]] && echo Will run $2
    eval "source $HOME/.bashrc; $2 & disown" &> /dev/null
  else
    [[ $DEBUG == '1' ]] && echo Will run $wname
    $wname &> /dev/null &
  fi
else
  # Raise
  wmctrl -i -a $target 1>/dev/null
fi

