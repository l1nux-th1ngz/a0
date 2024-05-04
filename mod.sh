#!/bin/bash

# File selection
DIRECTORY=$(zenity --file-selection --directory --width 650 --height 400)

# C Select directory
if [ -n "$DIRECTORY" ]; then
    # Change the permissions of the selected directory
    chmod 777 "$DIRECTORY"
    # Display message
    zenity --info --text="Permissions for $DIRECTORY have been changed to 777."
else
    # Display an error message if no directory was selected
    zenity --error --text="No directory selected. Please try again."
fi
