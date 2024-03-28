#!/bin/bash

# Oh My Mash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Add theme
git clone https://github.com/agnoster/agnoster-zsh-theme.git ~/.oh-my-bash/custom/themes/agnoster

# Add theme to bashrc
echo 'OSH_THEME="agnoster"' >> ~/.bashrc

# Run bashrc
source ~/.bashrc

# Install yt-dlp
sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp

# Install JetBrainsMono font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip JetBrainsMono.zip
sudo cp -avr JetBrainsMono/ /usr/share/fonts/truetype/
fc-cache -f -v
rm JetBrainsMono.zip

# Oh-my-bash
bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# Install Starship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo 'starship preset nerd-font-symbols > ~/.config/starship.toml' | sh

# Add custom configurations to ~/.config/starship.toml
cat <<EOF >> ~/.config/starship.toml
[time]
disabled = false
format = '[$time](blue)'
time_format = "%H:%M"
[character]
success_symbol = " [λ](bold green)"
error_symbol = " [λ](bold red)"
EOF

# Colorschemes
bash -c "$(wget -qO- https://git.io/vQgMr)"

# Install Neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo apt install ./nvim-linux64.deb

# Install vim-plug for (Neo)Vim plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.vim/plugged/

# Ranger icons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "default_linemode devicons" >> ~/.config/ranger/rc.conf

# Configure git
git config --global user.email "mail"
git config --global user.name "name"

# Generate SSH key
ssh-keygen

# Alternatively, if you already have an SSH key:
# ssh-add
# chmod 600 ~/.ssh/id_rsa
# chmod 600 ~/.ssh/id_rsa.pub

# Add ~/bin to PATH
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc

# Run bashrc again
source ~/.bashrc

echo "Setup completed."
