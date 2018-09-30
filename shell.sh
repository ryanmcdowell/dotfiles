#!/bin/bash

# Retrieve the operating system information.
OS=`uname`

# Set OSX shell utilities
if [[ "$OS" == 'Darwin' ]]; then

    # Install Python & Pip if not already installed
    brew install python && easy_install pip

    # Install zsh and reconfigure the shell
    brew install zsh
    sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

    # System Utilities
    brew install archey
    brew install bat
    brew install cmatrix
    brew install colordiff
    brew install ctags
    brew install curl
    brew install dark-mode
    brew install ettercap
    brew install glances
    brew install htop-osx
    brew install httpie
    brew install iftop
    brew install irssi
    brew install jq
    brew install mdcat
    brew install mtr
    brew install ninvaders
    brew install nmap
    brew install openssl
    brew install samba
    brew install siege
    brew install speedtest_cli
    brew install tig
    brew install tmux
    brew install tree
    brew install vim --with-override-system-vi
    brew install vitetris
    brew install watch
    brew install w3m
    brew install wget

    # Install duplicate system utilities (GNU) to replace OSX's
    brew install grep --with-default-names
    brew install gzip
    brew install lsof
    brew install rsync
    brew install screen

    # Install applications via brew cask
    brew tap caskroom/versions

    # Install iTerm2 to use as the default Terminal on OSX
    brew cask install iterm2

    # Download the iTerm color schemes
    git clone git@github.com:mbadolato/iTerm2-Color-Schemes.git ~/Desktop/iterm-color-schemes

    # Install awesome fonts so powerline icons properly display in the shell
    brew tap caskroom/fonts
    brew cask install font-awesome-terminal-fonts
fi

# Install vim configuration
printf "\n\nInstalling vim config...\n"
source vim.sh

# Link the config files
printf "\n\nLinking config files...\n"
source link.sh

# Reload the terminal
source ~/.zshrc



