

#!/bin/bash

# Create directories in the home directory
mkdir -p "$HOME/.fonts"
mkdir -p "$HOME/.icons"
mkdir -p "$HOME/.themes"
mkdir -p "$HOME/bin"
mkdir -p "$HOME/Wallpapers"
mkdir -p "$HOME/Git"
mkdir -p "$HOME/Debs"

# Create directories in the .config directory
mkdir -p "$HOME/.config/autostart"
mkdir -p "$HOME/.config/polybar"

# Set PATH variable
echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"

# Create launch.sh script
cat <<EOF > "$HOME/bin/launch.sh"
#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
EOF

# Make launch.sh executable
chmod +x "$HOME/bin/launch.sh"

# Copy Polybar config file
mkdir -p "$HOME/.config/polybar"
cp /etc/polybar/config.ini "$HOME/.config/polybar/config.ini"

echo "Setup completed."
