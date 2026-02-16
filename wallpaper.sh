#!/bin/bash

MAIN_CONFIG="$HOME/.config/hypr/hyprpaper.conf"
TMP_CONFIG="$HOME/.cache/hyprpaper.conf"
WALLPAPER_DIR="$HOME/Pictures/Wallpaper"

# Pick any image
wallpaper=$(zenity --file-selection \
    --title="Choose Wallpaper" \
    --filename="$WALLPAPER_DIR/" \
    --file-filter="*.jpg *.jpeg *.png")

# Exit if cancelled
[[ -z "$wallpaper" ]] && exit

# Convert to absolute path
wallpaper=$(realpath "$wallpaper")

# Copy main config and override wallpaper/preload
cp "$MAIN_CONFIG" "$TMP_CONFIG"
sed -i "/^wallpaper/c\wallpaper = ,$wallpaper" "$TMP_CONFIG"
sed -i "/^preload/c\preload = $wallpaper" "$TMP_CONFIG"

# Reload Hyprpaper
pkill -f hyprpaper -c
sleep 0.2
hyprpaper -c "$TMP_CONFIG" &
sleep 0.1
exit
