#!/bin/bash
# rc script for my desktop environment

cd

desk_height=$( xdpyinfo | grep dimensions | cut -d ' ' -f 7 | cut -d x -f 2 )
[[ desk_height -gt 1200 ]] && export HIDPI=1 || export HIDPI=0

source ~/.bashrc

# echo `whoami` "@" $PWD @ `date` >> ~/log.t

# xrdb merge ~/.sh/Xresources &
# setxkbmap -layout 'us,ru' -option 'grp:alt_shift_toggle,grp_led:scroll' &

# xinput --set-prop "SYN1B7F:01 06CB:2991 Touchpad" "Synaptics Two-Finger Scrolling" 1 1
# xinput --set-prop "SYN1B7F:01 06CB:2991 Touchpad" "Synaptics Finger" 80 100 0
# xinput --set-prop "SYN1B7F:01 06CB:2991 Touchpad" "Synaptics Edge Scrolling" 1 0 0
# xinput set-prop "Clearly Superior Technologies. CST Laser Trackball" "libinput Accel Speed" -.7
# xset s 800 800; xset -dpms ; xset dpms 0 0 0
xset dpms 1200 0 0
xset s 0 0
xset -b
xset r rate 220 33 # set keyboard repeat rate

sxd.sh &
# killall sxhkd; sxhkd -c ~/.sh/sxhkdrc &

if [[ ! -f /tmp/nowis ]]; then # set wallpaper
  if [[ -f $HOME/.config/nitrogen/bg-saved.cfg ]]; then
    nitrogen --restore &
  else
    nitrogen --set-zoom-fill  $git/wlp/earth_by_tatasz_d8snwb5.png
  fi
fi
# ( sleep .3; nitrogen --restore & ) # failsafe

# xinput set-prop "A4TECH USB Device" "libinput Accel Speed" -.5
# xinput set-prop "LVT ENDGAME GEAR XM1" "libinput Accel Speed" -.5
xinput set-prop "RAPOO Rapoo 2.4G Wireless Device" "libinput Accel Speed" -.7
# xinput set-prop "pointer:Logitech MX Master 3" "libinput Accel Speed" -.5

if [[ "$HOSTNAME" =~ killer[pc,PC] ]]; then
  # xrandr --dpi 110x110
  xrdb -merge <(echo "Xft.dpi: 108") &
  # echo -e 'power on\nquit' | bluetoothctl
  polybar.sh &
  killall unclutter; unclutter &

elif [[ $HOSTNAME = "virtpc" ]]; then
  xrdb -merge <(echo "Xft.dpi: 104") &

elif [[ "$HOSTNAME" =~ "servant" ]]; then
  xrdb -merge <(echo "Xft.dpi: 120") &
  xrandr --output DP-1 --mode 2560x1440
  pgrep earlyoom | grep . || earlyoom -m 2 -n &> /dev/null &

elif [[ "$HOSTNAME" =~ "machine" ]]; then
  # xrandr --output HDMI-2 --mode 2560x1440
  xrandr --output DP-1 --mode 2560x1440 --rate 144
  xrandr --dpi 128
  xrdb -merge <(echo "Xft.dpi: 128") &
  pgrep earlyoom | grep . || earlyoom -m 2 -n &> /dev/null &

elif [[ "$HOSTNAME" =~ "think" ]]; then
  xrdb -merge <(echo "Xft.dpi: 120") &
  # xrandr --output DisplayPort-0 --mode 2560x1440 --rate 100
  sleep 1

elif [[ "$HOSTNAME" =~ ^debianPC ]]; then
  xrdb -merge <(echo "Xft.dpi: 120")
  xrandr --output DP-2 --auto --left-of DP-1

elif [[ "$HOSTNAME" =~ ^debian10pc ]]; then
  xrandr --output DVI-D-0 --auto --left-of HDMI-0
  xrandr --output HDMI-2 --auto --right-of HDMI-1

elif [[ "$HOSTNAME" =~ ^white*(.*)ok ]]; then
  xset dpms 900 0 0
  xinput set-prop "SYN1B7F:01 06CB:2991 Touchpad" "libinput Tapping Enabled" 1

elif [[ "$HOSTNAME" =~ "warmPC" ]]; then
  # xrdb -merge <(echo "Xft.dpi: 108") &
  sleep 1
  pgrep transmission-da | grep . || trdwrap.sh &
  pgrep earlyoom | grep . || earlyoom -m 2 -n &> /dev/null &

elif [[ "$HOSTNAME" =~ [pc,PC] ]]; then
  xrandr --output VGA-2 --off

elif [[ "$HOSTNAME" =~ "ufo" ]]; then
  xset dpms 600 0 0
  xrdb -merge <(echo "Xft.dpi: 128") &
  nowis
fi

killall dunst
(
sleep .1
dunst -conf $dotfiles/conf/dunstrc &
)

# resta xbanish
picom.sh

# notify-send $HOSTNAME &

# killall osdsh ; osdsh  -p 0 -a 2 -d 1 -f -adobe-helvetica-bold-r-*-*-*-240-*-*-*-*-iso8859-* -c teal

# Run cosy apps
[[ -f /ln/lo/cur/beback.sh ]] && bash /ln/lo/cur/beback.sh

# echo RC done
notify-send 'Xrc complete'

