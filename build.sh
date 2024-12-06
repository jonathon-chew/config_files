#!/bin/bash

# Get Dev Tools on to the mac - including git!
./macOS.sh

# Run the Mac OS script to apply the settings that I like
cd $HOME
mkdir .config

# Sym link the zsh file to the one in the config folder
ln -s ./.zshrc . 

# Set the terminal settings
echo "When opening Terminal point to this file to get the current settings"
echo ""

# Get brew before running brew! 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Run the brew script installing regularly used programmes and CLI tools
./brew.sh

# Set the VS Code Setting
echo "When opening VSCode point to this file to get the current settings"
echo "Standard.code-profile"
