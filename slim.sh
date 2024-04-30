#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Check if the user 'savage' exists on the system
if id "savage" &>/dev/null; then
    echo "User 'savage' exists. Updating sudoers file..."
else
    echo "User 'savage' does not exist. Exiting..."
    exit 1
fi

# Add a line to the sudoers file that allows 'savage' to run all commands without a password
echo 'savage ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

echo "Operation completed successfully."
