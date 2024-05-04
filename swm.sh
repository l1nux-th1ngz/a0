#!/bin/bash

sudo apt-get -y install sway
sudo apt-get -y install ranger
sudo apt-get -y install nemo
sudo apt-get -y install xdg-user-dirs
sudo apt-get -y install xdg-user-dirs-gtk

# Make Dirs
xdg-user-dirs-update
xdg-user-dirs-gtk-update
# Copy 
mkdir -p ~/.config/sway
cp /etc/sway/config ~/.config/sway/

sudo apt-get -y install geany
sudo apt-get -y install sway-backgrounds
sudo apt-get -y install swaybg
sudo apt-get -y install swayidle
sudo apt-get -y install sway swaylock
sudo apt-get -y install xdg-desktop=portal-gtk
sudo apt-get -y install xdg-desktop-portal-wlr
sudo apt-get -y install git
sudo apt-get -y install curl
sudo apt-get -y install wget
sudo apt-get -y install playerctl
sudo apt-get -y install brightnessctl
sudo apt-get -y install qtwayland5
sudo apt-get -y install qt5ct
sudo apt-get -y install sudo apt -y install xcb
sudo apt-get -y install libxkbcommon-x11-dev
sudo apt-get -y install libxcb-xkb1
sudo apt-get -y install wofi
sudo apt-get -y install rofi
sudo apt-get -y install grim
sudo apt-get -y install slurp
sudo apt-get -y install waybar
sudo apt-get -y install mako-notifier
sudo apt-get -y install wayland-protocols
sudo apt-get -y install xwayland
sudo apt-get -y install libgtk-layer-shell-dev
sudo apt-get -y install dex
sudo apt-get -y install kitty
sudo apt-get -y install alacritty
sudo apt-get -y install jq
sudo apt-get -y install wl-clipboard
sudo apt-get -y install geany-plugins
sudo apt-get -y install clang
sudo apt-get -y install build-essential
sudo apt-get -y install libpam0g-dev
sudo apt-get -y install lib-xkb-dev
sudo apt-get -y install gvfs
sudo apt-get -y install gvfs-backends
sudo apt-get -y install sway-notification-center
sudo install -d -m 0755 /etc/apt/keyrings

# Import repository signing key
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null

# Verify fingerprint
gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}'

# Add repository
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null

# Configure package pinning
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla

# Update package lists and install Firefox
sudo apt-get update && sudo apt-get install firefox -y

sudo apt-get -y install chromium

echo "################################################################"
echo "Google Chrome"
echo "################################################################"
echo
echo "Getting the key"
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "Adding the repo"
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt install -y google-chrome-stable


echo "################################################################"
echo "Visual studio"
echo "################################################################"
echo
echo "Getting the key"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
echo "Adding the repo"
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt install -y code
# Update package lists
sudo apt-get update

# Install packages
sudo apt-get -y install udisks2
sudo apt-get -y install udiskie
sudo apt-get -y install whiptail
sudo apt-get -y install zenity
sudo apt-get -y install meson
sudo apt-get -y install libpcre2-dev
sudo apt-get -y install vlc
sudo apt-get -y install mpd
sudo apt-get -y install mpc
sudo apt-get -y install mpv
sudo apt-get -y install ffmpeg
sudo apt-get -y install libjson-c-dev
sudo apt-get -y install libpango-1.0-0
sudo apt-get -y install libcairo2-dev
sudo apt-get -y install mtools
sudo apt-get -y install dosfstools
sudo apt-get -y install sudo
sudo apt-get -y install adduser
sudo apt-get -y install acpi
sudo apt-get -y install avahi-daemon
sudo apt-get -y install libnotify-dev
sudo apt-get --no-install-recommends install sddm

# Clone repository
git clone https://github.com/FireStreaker2/dotfiles.git

# Change directory
cd dotfiles
cd hyprland

# Copy directories to .config
cp -r cava kitty waybar wofi ~/.config

# Go back to home directory
cd

# Enable services
sudo systemctl enable acpid
sudo systemctl enable avahi-daemon
sudo systemctl enable sddm

echo 'YOU CAN NOW USE SWAY ON DEBIAN'