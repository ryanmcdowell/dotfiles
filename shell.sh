#!/bin/sh

########################################################################
#  Shell
#
#  Installs a default shell configuration with
#
########################################################################

# Prompt for sudo password if user hasn't sudo'd recently
sudo -v

# Retrieve the operating system information.
OS=`uname`

# Set OSX shell utilities
if [[ "$OS" == 'Darwin' ]]; then

    # Check if Homebrew is installed.
    which -s brew
    if [[ $? != 0 ]]
    then
        # Install Homebrew
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        # Update Brew & all packages to latest version
        brew update
    fi

    # Install the coreutils package to use more up-to-date system utilities.
    brew install coreutils

    # Install zsh and reconfigure the shell
    brew install zsh
    sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

    ############################################
    # System Utilities
    ############################################
    brew install archey
    brew install bat
    brew install cmatrix
    brew install colordiff
    brew install ctags
    brew install curl
    brew install dark-mode
    brew install ettercap
    brew install ffmpeg
    brew install gh
    brew install glances
    brew install graphviz
    brew install htop-osx
    brew install httpie
    brew install iftop
    brew install irssi
    brew install jmeter
    brew install jq
    brew install mtr
    brew install ninvaders
    brew install nmap
    brew install openssl
    brew install samba
    brew install siege
    brew install speedtest_cli
    brew install achannarasappa/tap/ticker
    brew install tig
    brew install tldr
    brew install tmux
    brew install tree
    brew install vim --with-override-system-vi
    brew install vitetris
    brew install watch
    brew install w3m
    brew install wget
    brew install youtube-dl

    # Install duplicate system utilities (GNU) to replace OSX's
    brew install grep --with-default-names
    brew install gzip
    brew install lsof
    brew install rsync
    brew install screen

    ############################################
    # Development Tools
    ############################################

    # Install Google Cloud SDK
    brew install --cask google-cloud-sdk

    # Languages
    brew install java                           # Java SDK
    brew install jenv                           # Virtual env for java
    brew install go                             # Go SDK
    brew install groovy                         # Groovy SDK
    brew install node                           # Node SDK
    brew install python && easy_install pip     # Python SDK
    brew install ruby                           # Ruby SDK
    brew install scala                          # Scala SDK

    # DevOps
    brew install docker
    brew install boot2docker
    brew install gradle
    brew install maven
    brew install terraform

    # Data Format
    brew install protobuf

    ############################################
    # Terminal
    ############################################

    # Install iTerm2 to use as the default Terminal on OSX
    brew install --cask iterm2

    # Download the iTerm color schemes
    git clone git@github.com:mbadolato/iTerm2-Color-Schemes.git ~/Desktop/iterm-color-schemes

    # Install awesome fonts so powerline icons properly display in the shell
    brew install --cask homebrew/cask-fonts/font-awesome-terminal-fonts

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

    # Manual install: archey
    git clone https://github.com/HorlogeSkynet/Archey4.git /tmp/archey4
    chmod +x /tmp/archey4/archey
    sudo cp /tmp/archey4/archey /usr/bin/archey

    # Manual install: bat
    curl -L https://github.com/sharkdp/bat/releases/download/v0.8.0/bat_0.8.0_amd64.deb -o /tmp/bat.deb && dpkg -i /tmp/bat.deb

    # Manual install: jenv
    git clone https://github.com/gcuisinier/jenv.git ~/.jenv

    # Manual install: ticker
    curl -Ls https://api.github.com/repos/achannarasappa/ticker/releases/latest \
        | grep -wo "https.*linux-amd64*.tar.gz" \
        | wget -qi - \
        && tar -xf ticker*.tar.gz \
        && chmod +x ./ticker \
        && sudo mv ticker /usr/local/bin/

fi

# Install vim configuration
printf "\n\nInstalling vim config...\n"
source vim.sh

# Link the config files
# Change the directory to the dotfiles repository
cd "$(dirname "${BASH_SOURCE}")";

# Set the repo directory variable
REPO_DIR=`pwd`

printf "Linking dotfiles... \n"
ln -sf ${REPO_DIR}/aliases ~/.aliases
ln -sf ${REPO_DIR}/environment ~/.environment
ln -sf ${REPO_DIR}/functions ~/.functions
ln -sf ${REPO_DIR}/gitconfig ~/.gitconfig
ln -sf ${REPO_DIR}/motd ~/.motd
ln -sf ${REPO_DIR}/screenrc ~/.screenrc
ln -sf ${REPO_DIR}/vimrc ~/.vimrc
ln -sf ${REPO_DIR}/zshrc ~/.zshrc

# Reload the terminal
source ~/.zshrc



