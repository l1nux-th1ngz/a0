#!/bin/bash

# Function to add repositories
add_repo() {
    if ! grep -q "^deb .* $1 " /etc/apt/sources.list /etc/apt/sources.list.d/*; then
        echo "Adding repository: $1"
        echo "deb $2" | sudo tee -a /etc/apt/sources.list.d/$1.list >/dev/null
        sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com [KEY]
        sudo apt update
    fi
}

# Add BackPorts and Non-Free repositories
add_repo "backports" "http://deb.debian.org/debian bookworm-backports main"
add_repo "non-free" "http://deb.debian.org/debian bookworm non-free"

# Additional BackPorts
sudo add-apt-repository -y "deb http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware"
sudo add-apt-repository -y "deb-src http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware"
sudo add-apt-repository -y "deb http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware"
sudo add-apt-repository -y "deb-src http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware"

# Update package lists
sudo apt update

# Install desired packages
sudo apt install -y i3 
sudo apt install -y i3-wm
sudo apt install -y i3lock
sudo apt install -y i3lock-fancy
sudo apt install -y i3status
sudo apt install -y dunst
sudo apt install -y synaptic 
sudo apt install -y gdebi 
sudo apt install -y lsb-release
sudo apt install -y notepadqq 
sudo apt install -y ranger 
sudo apt install -y kitty 
sudo apt install -y alacritty 
sudo apt install -y rofi 
sudo apt install -y nemo 
sudo apt install -y gexec 
sudo apt install -y dconf-editor 
sudo apt install -y nemo-preview 
sudo apt install -y nemo-fileroller 
sudo apt install -y nemo-compare 
sudo apt install -y nemo-seahorse 
sudo apt install -y dex 
sudo apt install -y qt5ct 
sudo apt install -y pipewire 
sudo apt install -y wireplumper 
sudo apt install -y xdg-user-dirs-gtk 

# Make Dirs
xdg-user-dirs-gtk-update 

sudo apt install -y curl 
sudo apt install -y wget 

# Curl Installs
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile complete --default-toolchain nightly 
echo "source $HOME/.cargo/env"

# Install non-esr Firefox
sudo install -d -m 0755 /etc/apt/keyrings 
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null 
gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}' 
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null 
echo 'Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla 
sudo apt-get update && sudo apt-get install -y firefox 

sudo apt install -y zlib1g-dev 
sudo apt install -y libncurses5-dev 
sudo apt install -y libgdbm-dev 
sudo apt install -y libnss3-dev 
sudo apt install -y libssl-dev 
sudo apt install -y libreadline-dev 
sudo apt install -y libffi-dev 
sudo apt install -y software-properties-common 
sudo apt install -y zenity 
sudo apt install -y 7zip 
sudo apt install -y a2ps 
sudo apt install -y adwaita-icon-theme-full 
sudo apt install -y alsa-firmware-loaders 
sudo apt install -y alsa-tools-gui 
sudo apt install -y alsa-utils 
sudo apt install -y alsamixergui 
sudo apt install -y sudo 
sudo apt install -y scrot 
sudo apt install -y maim 
sudo apt install -y libnotify-bin 
sudo apt install -y libnotify4 
sudo apt install -y slop 
sudo apt install -y libslopy7.6 
sudo apt install -y scrot 
sudo apt install -y lolcat 
sudo apt install -y most 
sudo apt install -y nitrogen 
sudo apt install -y nomacs 
sudo apt install -y numlockx 
sudo apt install -y pavucontrol 
sudo apt install -y picom 
sudo apt install -y gvfs 
sudo apt install -y gvfs-backends 
sudo apt install -y udisks2 
sudo apt install -y udiskie 
sudo apt install -y mount 

# Make Dirs
mkdir -p ~/.config/i3 ~/.config/rofi ~/.config/kitty ~/.config/alacritty ~/.qt5ct ~/.config/mpv ~/mcmpcpp ~/ranger

# Install LightDM
sudo apt install -y lightdm 
sudo apt install -y lightdm-gtk-greeter-settings 
sudo apt install -y lightdm-settings 
sudo apt install -y slick-greeter 
sudo systemctl enable lightdm 
sudo mkdir -p /etc/lightdm/lightdm.conf.d/
