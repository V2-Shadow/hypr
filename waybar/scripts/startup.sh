#!/bin/bash
CACHE_PATH="$HOME/.config/hypr/waybar/cache"

FILE=$CACHE_PATH/style.css    
if [ -f $FILE ]; then
   echo "File $FILE exists."
   waybar -c $CACHE_PATH/config.jsonc -s $CACHE_PATH/style.css
else
   echo "File $FILE does not exist."
   waybar -c $CACHE_PATH/config.jsonc
fi