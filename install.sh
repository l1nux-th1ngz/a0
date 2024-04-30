#!/bin/bash

# Update system packages
sudo apt update && sudo apt upgrade -y

cat << EOF
# ===========================================================================
# CHMOD SOME STUFF
# ===========================================================================
EOF

# Make scripts executable
chmod +x "./setup/packages.sh"
chmod +x "./setup/gsettings.sh"
chmod +x "./setup/entries.sh"

# Execute scripts
bash "./setup/packages.sh"
bash "./setup/gsettings.sh"
bash "./setup/entries.sh"

# Clone configs
cat << EOF
# ===========================================================================
# COPY SOME STUFF
# ===========================================================================
EOF

mkdir ~/.config
cp -r -v ./config/* ~/.config

printf "\n\n\n\n\n\n\n\n\n\n"

cat << EOF
# ===========================================================================
# FINISH
# ===========================================================================

- It is recommended to restart your computer. Use "sway" command to enter desktop.
  We assume you know basics of Sway, Waybar or Wayland in general. Each config is
  easy to edit - left with comments. For more help - check installation steps on
  project's github page. Good luck!
EOF
