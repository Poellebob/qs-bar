#!/bin/sh

# This script generates a color palette using matugen and creates a Colors.qml file.

# 1. Read wallpaper path from wallpaper.conf
WALLPAPER_PATH=$(cat wallpaper.conf)

# 2. Run matugen to generate a JSON color palette.
matugen -j hex image "$WALLPAPER_PATH" > colors.json

# 3. Check if matugen ran successfully
if [ ! -s colors.json ]; then
    echo "Error: matugen failed to generate colors.json. Make sure matugen is installed and the path in wallpaper.conf is correct."
    exit 1
fi

# 4. Convert the JSON to QML using jq.
(echo "import QtQuick"
echo
echo "QtObject {"

# Use jq to iterate over the keys and values in the JSON file
jq -r '.colors.dark | to_entries | map("  readonly property color dark_" + .key + ": \"" + .value + "\"") | .[]' colors.json
jq -r '.colors.light | to_entries | map("  readonly property color light_" + .key + ": \"" + .value + "\"") | .[]' colors.json

echo "}") > modules/colors/Colors.qml

# 5. Inform the user.
echo "Colors.qml generated successfully. You may need to restart the shell to see the changes."