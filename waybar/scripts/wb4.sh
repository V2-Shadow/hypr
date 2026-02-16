#!/bin/bash
CACHE_PATH="$HOME/.config/hypr/waybar/cache"
CONFIG_PATH="$HOME/.config/hypr/waybar/wb4"
pkill waybar
rm -r $CACHE_PATH/*
cp -r $CONFIG_PATH/* $CACHE_PATH/

bash $HOME/.config/hypr/waybar/scripts/startup.sh &