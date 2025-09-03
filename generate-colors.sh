#!/bin/sh

WALLPAPER_PATH=$(cat ~/.config/quickshell/wallpaper.conf)

matugen -j hex image "$WALLPAPER_PATH" 2>/dev/null | grep '{' | jq . > ~/.config/quickshell/modules/colors/colors.json

if [ ! -s ~/.config/quickshell/modules/colors/colors.json ]; then
    echo "Error: matugen failed to generate colors.json. Make sure matugen is installed and the path in wallpaper.conf is correct."
    exit 1
fi

(echo "import QtQuick"
echo
echo "QtObject {"

jq -r '.colors.dark  | to_entries | map("  readonly property color dark_"  + .key + ": \"" + .value + "\"") | .[]' ~/.config/quickshell/modules/colors/colors.json
jq -r '.colors.light | to_entries | map("  readonly property color light_" + .key + ": \"" + .value + "\"") | .[]' ~/.config/quickshell/modules/colors/colors.json

echo "}") > ~/.config/quickshell/modules/colors/Colors.qml
