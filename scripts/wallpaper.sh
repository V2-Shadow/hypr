#! /bin/bash
Outputs=$(hyprctl monitors | grep '^Monitor' | awk -F'[ :]' '{print $2}') #Get the Names Hyprland gives the monitors
MonitorCount=$(hyprctl monitors | grep -c '^Monitor') #Get number of monitors

echo "Outputs: $Outputs" 
echo "Number: $MonitorCount"

if [ "$MonitorCount" -gt 1 ]; then #When the number of monitors is greater then 2, activate the monitor selection Window
    echo "Multi"
    SelectorActive=1
else    
    echo "Single"
    SelectorActive=0
fi

SOURCE=$(zenity --file-selection \
    --filename="$HOME/Pictures/Wallpaper/" \
    --title="Select Wallpaper" \
    --file-filter="*.png") #Generate the Wallpaper selection window

[[ -z "$SOURCE" ]] && exit 1

if [ "$SelectorActive" -eq 1 ]; then
    CHOICE=$(zenity --list \
        --title="Choose Monitor" \
        --text="Select Wallpaper" \
        --column="ID" --column="Monitor Name" --hide-column=1 \
        "1" "DP-1" \
        "2" "DP-2" \
        "3" "DP-3" \
        "4" "HDMI-A-1") #Generate the Monitor selection window

    [[ -z "$CHOICE" ]] && exit 1

    case $CHOICE in
    "1") FINAL_PATH="$HOME/.cache/wallpaper/DP-1.png" ;;
    "2") FINAL_PATH="$HOME/.cache/wallpaper/DP-2.png" ;;
    "3") FINAL_PATH="$HOME/.cache/wallpaper/DP-3.png" ;;
    "4") FINAL_PATH="$HOME/.cache/wallpaper/HDMI-A-1.png" ;;
    esac #Set the finalPath to the chosen Monitor
else
    case $Outputs in
    "DP-1") FINAL_PATH="$HOME/.cache/wallpaper/DP-1.png" ;;
    "DP-2") FINAL_PATH="$HOME/.cache/wallpaper/DP-2.png" ;;
    "DP-3") FINAL_PATH="$HOME/.cache/wallpaper/DP-3.png" ;;
    "HDMI-A-1") FINAL_PATH="$HOME/.cache/wallpaper/HDMI-A-1.png" ;;
    esac #Set the finalPath to the attatched Monitor

fi

mkdir -p $HOME/.cache/wallpaper/
cp "$SOURCE" "$FINAL_PATH" #Copy the Wallpaper file to the designated Wallpaper file

pkill hyprpaper #Kill hyprpaper
hyprctl dispatch exec hyprpaper #Start hyprpaper via hyprctl
notify-send "New Wallpaper applied" #Send notification