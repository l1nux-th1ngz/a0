#!/bin/bash

# Move all .sh files to the home directory
mv *.sh ~/ 

# Change directory to the home directory
cd ~/

# Pause for 30 seconds
sleep 30

# Change permissions of .sh files to 777
for file in *.sh; do
    echo "Changing permissions for file: $file"
    chmod 777 "$file"
done

# Sort files numerically then alphabetically
ls -l *.sh | sort -n | sort -k 9

