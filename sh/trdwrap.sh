#!/bin/bash
# Launch Transmission. But prevent it from spam journalctl

# killall -v transmission-daemon 2> /dev/null
if [[ $(pgrep vim | wc -l) -gt 0 ]]; then
  transmission-remote 9090 --exit
  sleep 1
fi

notify-send "(re-)Starting transmission-daemon…"

transmission-daemon --foreground --log-info 2>&1 | while read line; do
  echo $line |
    grep -v "announcer.c:\|platform.c:\|announce done (tr-dht.c:" |
    grep -v "Saved.*variant.c:" |
    while read line; do
      echo $line | grep -q "Queued for verification (verify.c:" &&
        notify-send --app-name="Transmission Started" "${line#* * }"
      echo $line | grep -q "changed from .Incomplete. to .Complete." &&
        notify-send --app-name="Transmission Complete" "${line#* * }"
      #echo $line | systemd-cat --identifier="TransWrap" --priority=5
    done 2>&1 > /dev/null
  done&disown

