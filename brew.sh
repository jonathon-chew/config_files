#/bin/bash

# Update Homebrew and Upgrade any already-installed formulae
brew update
brew upgrade
brew upgrade --cask
brew cleanup

# Define an array of packages to install using Homebrew.
packages=(
    "python"
    "bash"
    "zsh"
    "git"
    "node"
    "ffmepg"
    "tldr"
    "gh"
    "sqlite"
    "blueutil"
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

