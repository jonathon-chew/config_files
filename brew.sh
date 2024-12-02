#/bin/bash

# Define an array of packages to install using Homebrew.
packages=(
    "python@3.13"
    "bash"
    "zsh"
    "git"
    "node"
    "ffmepg"
    "tldr"
    "gh"
    "sqlite"
    "blueutil"
    "nvim"
    "vlc"
    "grandperspective"
    "firefox"
    "go"
)

# Loop over the array to install each application.
for package in "${packages[@]}"; do
    if brew list --formula | grep -q "^$package\$"; then
        echo "$package is already installed. Skipping..."
    else
        echo "Installing $package..."
        brew install "$package"
    fi
done

# Update Homebrew and Upgrade any already-installed formulae
brew update
brew upgrade
brew upgrade --cask
brew cleanup
