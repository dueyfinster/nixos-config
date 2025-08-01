#!/usr/bin/env bash
# Accepts:
# 1. a window condition and a sway command to be applied to the window if it exists
# 2. a command to be run if the window does not exist

# i3 example
# [ "$(i3-msg '[class=Emacs] focus')" = '[{"success":true}]' ] || i3-msg exec "Emacs"

# swaymsg does not return a string (by default), but we can use the return code
swaymsg "$1" || swaymsg exec "$2"
