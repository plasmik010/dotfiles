#!/bin/bash
# Umount block device with udevil and dmenu.

source $sh/dmenurc

LSBLK="lsblk"
target=$( $LSBLK -o NAME,FSTYPE,LABEL,SIZE,MOUNTPOINT | grep -e ".sd\|.nvme" | grep '/' | dmenuy | cut -f 1 -d " " | tr -cd '[:alnum:]' )
# mopoint=$( mount | grep "${target}" | cut -f 3 -d ' ' ); [ ! -z "${target}" ]
[ ! -z "${target}" ] && sync "/dev/$target" && ( udevil umount /dev/$target &> /tmp/vil2 && notify-send "/dev/$target unmounted" || notify-send "$(cat /tmp/vil2)" )

