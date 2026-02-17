#!/bin/bash
yad --title="Desktop Help" \
    --form \
    --width=325 --height=400 \
    --text="<b>Choose Waybar</b>" \
    --field="<b>Waybar alt-1</b>":fbtn "bash -c '$HOME/.config/hypr/waybar/scripts/wb1.sh; killall yad'" \
    --field="<b>Waybar alt-2</b>":fbtn "bash -c '$HOME/.config/hypr/waybar/scripts/wb2.sh; killall yad'" \
    --field="<b>Waybar alt-3</b>":fbtn "bash -c '$HOME/.config/hypr/waybar/scripts/wb3.sh; killall yad'" \
    --field="<b>Back to Default</b>":fbtn "bash -c '$HOME/.config/hypr/waybar/scripts/wb4.sh; killall yad'" \
    --button=Cancel!gtk-cancel:1
