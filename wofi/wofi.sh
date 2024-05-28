#!/usr/bin/env bash

# CONFIG="$HOME/.config/wofi/config/config"
CONFIG="$HOME/.config/wofi/cfg"
STYLE="$HOME/.config/wofi/src/mocha/style.css"
# STYLE="$HOME/.config/wofi/style.css"

if [[ ! $(pidof wofi) ]]; then
    wofi --conf "${CONFIG}" --style "${STYLE}"
else
    pkill wofi
fi
