#!/bin/bash

STATE_FILE="/tmp/hypr_fullscreen_state"
IS_FULLSCREEN=$(hyprctl activewindow -j | jq '.fullscreen')

if [ "$IS_FULLSCREEN" -eq 0 ]; then
  # Enter
  ORIG_ROUNDING=$(hyprctl getoption decoration:rounding -j | jq '.int')
  ORIG_BORDER=$(hyprctl getoption general:border_size -j | jq '.int')
  echo "$ORIG_ROUNDING" >"${STATE_FILE}.rounding"
  echo "$ORIG_BORDER" >"${STATE_FILE}.border"
  hyprctl keyword decoration:rounding 0
  hyprctl keyword general:border_size 0
  killall waybar
  hyprctl dispatch fullscreen 0
else
  # Exit
  if [ -f "${STATE_FILE}.rounding" ]; then
    ORIG_ROUNDING=$(cat "${STATE_FILE}.rounding")
    hyprctl keyword decoration:rounding "$ORIG_ROUNDING"
    rm "${STATE_FILE}.rounding"
  fi
  if [ -f "${STATE_FILE}.border" ]; then
    ORIG_BORDER=$(cat "${STATE_FILE}.border")
    hyprctl keyword general:border_size "$ORIG_BORDER"
    rm "${STATE_FILE}.border"
  fi
  hyprctl dispatch fullscreen 0
  if ! pgrep -x "waybar" >/dev/null; then
    waybar &
    disown
  fi
fi
