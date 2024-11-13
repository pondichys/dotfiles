#!/usr/bin/env bash

# Configure FR AZERTY keyboard
setxkbmap fr

# Start picom compositor
picom --config ~/.config/qtile/picom.conf &

# Set wallpaper and color schemes with pywal
# wal -i ~/.config/qtile/themes/zen/wallhaven-qz2e8l.jpg
