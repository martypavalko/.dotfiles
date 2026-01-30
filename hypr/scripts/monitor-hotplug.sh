#!/bin/bash
# Monitor hotplug handler for Hyprland
# Moves all windows to the external monitor when connected,
# and back to built-in display when disconnected.
#
# Usage: monitor-hotplug.sh [--disable-internal]
#   --disable-internal  Turn off the laptop display when external is connected

EXTERNAL="DP-1"
INTERNAL="eDP-1"
DISABLE_INTERNAL=false

if [[ "$1" == "--disable-internal" ]]; then
    DISABLE_INTERNAL=true
fi

move_all_windows_to() {
    local target_monitor="$1"
    hyprctl clients -j | jq -r '.[] | .address' | while read -r addr; do
        hyprctl dispatch movewindow "mon:${target_monitor}" address:"${addr}" 2>/dev/null
    done
    hyprctl dispatch focusmonitor "${target_monitor}"
    hyprctl dispatch workspace 1
}

handle() {
    while read -r line; do
        case "$line" in
            monitoradded\>\>"$EXTERNAL"*)
                sleep 0.5
                move_all_windows_to "$EXTERNAL"
                if $DISABLE_INTERNAL; then
                    hyprctl keyword monitor "${INTERNAL}, disable"
                fi
                ;;
            monitorremoved\>\>"$EXTERNAL"*)
                sleep 0.5
                if $DISABLE_INTERNAL; then
                    hyprctl keyword monitor "${INTERNAL}, 1920x1080@60, 0x0, 1.5"
                    sleep 0.5
                fi
                move_all_windows_to "$INTERNAL"
                ;;
        esac
    done
}

socat -U - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | handle
