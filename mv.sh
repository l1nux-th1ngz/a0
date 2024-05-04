#!/bin/bash

# Use dialog to create a directory selection dialog
DIRECTORY=$(dialog --stdout --title "Please choose a directory" --dselect $HOME/ 14 48)

# Check if the user selected a directory
if [ -n "$DIRECTORY" ]; then
    # Move the selected directory to the home directory of the user "savage"
    mv "$DIRECTORY" /home/savage/
    # Display a success message
    dialog --title "Message" --msgbox "The directory $DIRECTORY has been moved to /home/savage." 6 44
else
    # Display an error message if no directory was selected
    dialog --title "Message" --msgbox "No directory selected. Please try again." 6 44
fi
