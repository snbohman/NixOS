#!/usr/bin/env bash

STATE="${XDG_RUNTIME_DIR}/mcsr-binds-disabled"

if [[ -f "$STATE" ]]; then
    # Restore normal bindings
    hyprctl keyword bind "SUPER, F, fullscreen, 0"
    hyprctl keyword bind "SUPER, SPACE, exec, toggle-float"

    rm "$STATE"
    notify-send "MCSR mode" "Desktop shortcuts enabled"
else
    # Disable desktop bindings
    hyprctl keyword unbind "SUPER, F"
    hyprctl keyword unbind "SUPER, SPACE"

    touch "$STATE"
    notify-send "MCSR mode" "Desktop shortcuts disabled"
fi
