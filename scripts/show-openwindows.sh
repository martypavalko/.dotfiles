#!/bin/bash
CONFIG="$HOME/.config/wofi/config/config"
STYLE="$HOME/.config/wofi/src/mocha/style.css"
WINDOW=$(hyprctl clients | grep "class: " | awk '{gsub("class: ", "");print}' | wofi --show dmenu --conf "${CONFIG}" --style "${STYLE}")
if [ "$WINDOW" = "" ]; then
    exit
fi
hyprctl dispatch focuswindow $WINDOW
