#!/bin/bash

# Clone Eww repository dir
git clone https://github.com/elkowar/eww

# Move in
cd eww


## Install build necessary dependencies
sudo apt install -y libgtk-layer-shell-dev libgtk-3-dev libpango1.0-dev libgdk-pixbuf-2.0-dev libglib2.0-dev

# Move to build folder
cd target/release

# Download and execute Rustup installer
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y --profile complete --default-toolchain nightly

# Set path and source cargo environment variables
echo 'source "$HOME/.cargo/env"' >> ~/.bashrc
source ~/.bashrc

# Build Eww for x11
cargo build --release --no-default-features --features xll

# Create configuration folder
mkdir ~/.config/eww

# Start Eww daemon
./eww daemon

# Add to session PATH appending to ~/.bashrc
echo 'export PATH="$HOME/.config/eww/eww/target/release:$PATH"' >> ~/.bashrc

## Open a new terminal or source .bashrc
source ~/.bashrc

## Test eww from session PATH
eww

# Copy Eww example widget
## Move to the eww repository folder
cd ../../examples/eww-bar

## Move example bar to configuration folder
mv -r * ~/.config/eww/

# Download or create eww widgets (eww.yuck && eww.scss) and open them
git clone --depth=1 https://github.com/adi1090x/widgets.git

wait
# Copy eww executable in your PATH (/bin, /usr/bin, ).
sudo cp ./eww /usr/bin/

cd ~

echo "################################################################"
echo "###################     EWWW IS Done         ######################"
echo "################################################################