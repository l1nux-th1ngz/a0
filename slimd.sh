#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Check if the user 'slim' exists on the system
if id "slim" &>/dev/null; then
    echo "User 'slim' exists. Updating sudoers file..."
else
    echo "User 'slim' does not exist. Exiting..."
    exit 1
fi

# Create a file for 'slim' in the /etc/sudoers.d directory
echo 'slim ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo -f /etc/sudoers.d/slim

echo "Operation completed successfully."
