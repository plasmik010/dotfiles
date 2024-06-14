#!/bin/sh
# Google something
# Usage:  $ google.sh "funny cats"

$BROWSER https://www.google.com/search?q="$*" &>/dev/null
# ror.sh $BROWSER ' '

