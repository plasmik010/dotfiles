#!/bin/bash
# Get ready for plasmancing!

# Tune desktop 1
bspc desktop -f 1
bspc desktop --layout monocle
bspc config ignore_ewmh_focus true

# Populate desktop 1
instancs=$(wmctrl -lx | grep "  0 " | grep kitty | grep -i btop -c)
[[ $instancs -eq 0 ]] && 
    {
    bspc rule -a *:* -o desktop='^1'
    echo 77
    kitty btop &
    }
# wmctrl -lx | grep kitty | grep -i vim -c ||
    # {
    # bspc rule -a *:* -o desktop='^1'
    # kitty bash -c "nvim -S /ln/co/nvim/session/comon" &
    # }

bspc desktop -f 3

# # Populate desktop 2
# wmctrl -lx | grep "  1 " | grep kitty -c ||
# # wmctrl -lx | grep kitty -c ||
#     {
#     sleep .1
#     bspc desktop -f 2
#     bspc rule -a *:* -o desktop='^2'
#     # kitty bash -c "vifm; bash" &
#     kitty &
#     sleep .2
#     bspc node -p east
#     bspc node -o .44
#     bspc rule -a *:* -o desktop='^2'
#     # kitty &
#     # bspc rule -a *:* -o desktop='^2'
#     # kitty &
#     }

