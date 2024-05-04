#!/bin/bash

# Use Zenity to create a file selection dialogue with specified width and height
DIRECTORY=$(zenity --file-selection --directory --width 650 --height 400)

# Check if the user selected a directory
if [ -n "$DIRECTORY" ]; then
    # Change the permissions of the selected directory
    chmod 777 "$DIRECTORY"
    # Display a success message
    zenity --info --text="Permissions for $DIRECTORY have been changed to 777." --width 650 --height 400
else
    # Display an error message if no directory was selected
    zenity --error --text="No directory selected. Please try again." --width 650 --height 400
fi
