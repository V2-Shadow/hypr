#!/bin/bash
CACHE_PATH="$HOME/.config/hypr/waybar/cache"

FILE=$CACHE_PATH/style.css    
if [ -f $FILE ]; then
   waybar -c $CACHE_PATH/config.jsonc -s $CACHE_PATH/style.css
   notify-send "File $FILE exists."
else
   waybar -c $CACHE_PATH/config.jsonc
   notify-send "File $FILE does not exist."
fi