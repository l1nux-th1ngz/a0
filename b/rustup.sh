#!/bin/bash


# Download and execute Rustup installer
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y --profile complete --default-toolchain nightly

# Set path and source cargo environment variables
echo 'source "$HOME/.cargo/env"' >> ~/.bashrc
source ~/.bashrc
