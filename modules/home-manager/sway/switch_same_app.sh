#!/bin/bash

current_class=$(swaymsg -t get_tree | jq -r '.. | select(.focused?) | .window_properties.class')

if [[ -n "$current_class" ]]; then
    swaymsg "[class=\"$current_class\"] focus"
fi
