#!/bin/bash

desk_height=$( xdpyinfo | grep dimensions | cut -d ' ' -f 7 | cut -d x -f 2 )

if [[ desk_height -gt 1200 ]]; then
    export HIDPI=1
else
    export HIDPI=0
fi

