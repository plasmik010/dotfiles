#!/bin/bash
# Print colors palette

# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.

# for fgbg in 38 48 ; do # Foreground / Background
#     for color in {0..255} ; do # Colors
#         # Display the color
#         printf "\e[${fgbg};5;%sm  %3s  \e[0m" $color $color
#         # Display 6 colors per lines
#         if [ $((($color + 1) % 6)) == 4 ] ; then
#             echo # New line
#         fi
#     done
#     echo # New line
# done

echo
for color in {0..15}; do
    printf "\e[38;5;%sm  %3s  \e[0m" $color $color
done
echo
for color in {0..15}; do
    printf "\e[48;5;%sm  %3s  \e[0m" $color $color
done
echo
echo

for color in {16..255}; do
    # Display the color
    # printf "\e[38;5;%sm  %3s  \e[0m" $color $color
    # printf "\e[38;5;%sm  %3s  \e[0m  \e[48;5;%sm  %3s  \e[0m " $color $color $color $color
    printf "\e[38;5;%sm  %3s  \e[0m" $color $color
    # Display 6 colors per lines
    if [ $((($color - 15) % 6)) == 0 ]; then
        printf "   "
        for color2 in {0..5}; do
            col=$((color-color2))
            printf "\e[48;5;%sm  %3s  \e[0m" $col $col
        done
        echo # New line
    fi
done
echo # New line

exit 0
