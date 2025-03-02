#!/usr/bin/env bash

# Get the current focused window's app_id
focused_window=$(swaymsg -t get_tree | jq '.. | select(.focused?) | .id')
app_id=$(swaymsg -t get_tree | jq -r --argjson id "$focused_window" '.. | select(.id? == $id) | .app_id')

# Get all windows with the same app_id, sorted in order
windows=($(swaymsg -t get_tree | jq -r --arg app_id "$app_id" '
  .. | select(.app_id? == $app_id) | .id' | sort -n))

# Find the index of the currently focused window
for i in "${!windows[@]}"; do
  if [[ "${windows[i]}" == "$focused_window" ]]; then
    next_index=$(( (i + 1) % ${#windows[@]} ))  # Loop back to first window if at the end
    swaymsg "[con_id=${windows[next_index]}]" focus
    exit 0
  fi
done
