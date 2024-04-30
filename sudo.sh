#!/bin/bash

# Add user to sudo group
sudo usermod -aG sudo savage

# Update sudoers file
echo "savage  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/savage

# Update polkit 
sudo sed -i 's/<allow_any>auth_admin<\/allow_any>/<allow_any>yes<\/allow_any>/g' /usr/share/polkit-1/actions/*
sudo sed -i 's/<allow_inactive>auth_admin<\/allow_inactive>/<allow_inactive>yes<\/allow_inactive>/g' /usr/share/polkit-1/actions/*
sudo sed -i 's/<allow_active>auth_admin<\/allow_active>/<allow_active>yes<\/allow_active>/g' /usr/share/polkit-1/actions/*
