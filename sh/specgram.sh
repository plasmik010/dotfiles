#!/bin/bash
# See cool spectrogram of an audiofile
# Needs 'sox' & 'feh'

SPEC_DIR=/tmp/spek
mkdir -p $SPEC_DIR

NSEC=$(date +%M%S%N)

sox "$1" -n remix 2 spectrogram -x 900 -y 550 -o${SPEC_DIR}/${NSEC}.png -p2 -t "$1"
feh -B black ${SPEC_DIR}/${NSEC}.png &>/dev/null
# rm /tmp/spec.png

