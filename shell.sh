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
    brew install tldr
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
elif [[ "$OS" == 'Linux' ]]; then
    sudo su
    apt-get install -y cmatrix
    apt-get install -y glances
    apt-get install -y htop
    apt-get install -y httpie
    apt-get install -y irssi
    apt-get install -y jq
    apt-get install -y mtr
    apt-get install -y ninvaders
    apt-get install -y nmap
    apt-get install -y openssl
    apt-get install -y siege
    apt-get install -y speedtest-cli
    apt-get install -y tig
    apt-get install -y tmux
    apt-get install -y tree
    apt-get install -y unzip
    apt-get install -y watch
    apt-get install -y w3m

    # Manual install: bat
    curl -L https://github.com/sharkdp/bat/releases/download/v0.8.0/bat_0.8.0_amd64.deb -o /tmp/bat.deb && dpkg -i /tmp/bat.deb
fi

# Install vim configuration
printf "\n\nInstalling vim config...\n"
source vim.sh

# Link the config files
printf "\n\nLinking config files...\n"
source link.sh

# Reload the terminal
source ~/.zshrc



