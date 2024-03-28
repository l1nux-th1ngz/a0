#!/bin/sh

### Select wallpaper directories to be shown 
BGDIR1="$HOME/Wallpapers"

### Uncomment if selection should NOT be written to ~/.fehbg 
# FEHBG="--no-fehbg"

### Select background setting mode
BGSET="--bg-scale"
# BGSET="--bg-fill"
# BGSET="--bg-max"
# BGSET="--bg-tile"

# Ensure the font path and size are correct
feh -r -t -P -N --scale-down -W 800 -E 100 -y 160 -J 100 --title "Wallpaper" \
--fontpath /usr/share/fonts/truetype/liberation/ --font LiberationSans-Regular.ttf/10 \
--index-info "" \
--action ";feh $FEHBG $BGSET %F" "$BGDIR1"

## Use --index-info "%n" for names generation
