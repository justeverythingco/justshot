#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Upload Image to JustShot
# @raycast.mode silent

# @raycast.icon ☁️
# @raycast.packageName JustShot
# @raycast.description Upload an image file to JustShot Cloud and copy the share link.
# @raycast.argument1 { "type": "text", "placeholder": "~/Desktop/shot.png" }

path="${1/#\~/$HOME}"                                                            # expand a leading ~
encoded=$(python3 -c 'import urllib.parse,sys; print(urllib.parse.quote(sys.argv[1]))' "$path")
open "justshot://upload?path=$encoded"
