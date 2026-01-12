#!/bin/sh

# Prompt for sudo password if user hasn't sudo'd recently
sudo -v

# Check if Homebrew is installed.
which -s brew
if [[ $? != 0 ]]
then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Put brew on the path so the rest of the commands can execute successfully
    export PATH=/opt/homebrew/bin:$PATH
else
    # Update Brew & all packages to latest version
    brew update
fi

# Install rosetta for applications unsupported on Apple Silicon
softwareupdate --install-rosetta

# Applications
#brew install --cask google-chrome
brew install --cask intellij-idea
brew install --cask sonos
brew install --cask spotify
brew install --cask sublime-text
brew install --cask the-unarchiver
brew install --cask thinkorswim
brew install --cask visual-studio-code




