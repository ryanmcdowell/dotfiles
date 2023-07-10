#!/bin/bash

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

# Change the directory to the dotfiles repository
cd "$(dirname "${BASH_SOURCE}")";

# Set the repo directory variable
REPO_DIR=`pwd`

# Set OSX shell utilities
if [[ "$OS" == 'Darwin' ]]; then

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

    # Install the coreutils package to use more up-to-date system utilities.
    brew install coreutils

    # Install zsh and reconfigure the shell
    brew install zsh
    sudo dscl . -create /Users/$USER UserShell /opt/homebrew/bin/zsh

    ############################################
    # System Utilities
    ############################################
    brew install archey4
    

    brew install bat
    brew install cmatrix
    brew install colordiff
    brew install ctags
    brew install curl
    brew install dark-mode
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
    brew install vim
    brew install vitetris
    brew install watch
    brew install w3m
    brew install wget
    brew install youtube-dl

    # Install duplicate system utilities (GNU) to replace OSX's
    brew install grep
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
    sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk \
     /Library/Java/JavaVirtualMachines/openjdk.jdk

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
    git clone git@github.com:mbadolato/iTerm2-Color-Schemes.git

    # Import all color schemes
    sh iTerm2-Color-Schemes/tools/import-scheme.sh schemes/*

    # Clean-up directory
    rm -rf iTerm2-Color-Schemes

    # Install awesome fonts so powerline icons properly display in the shell
    brew install --cask homebrew/cask-fonts/font-awesome-terminal-fonts

    # Install iTerm2 terminal utilities
    curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

elif [[ "$OS" == 'Linux' ]]; then
    # Change the shell to zsh
    sudo apt-get install zsh
    chsh -s $(which zsh)

    # Install packages
    sudo apt-get install -y cmatrix \
        glances \
        htop \
        httpie \
        irssi \
        jq \
        mtr \
        ninvaders \
        nmap \
        openssl \
        siege \
        speedtest-cli \
        tig \
        tmux \
        tree \
        unzip \
        watch \
        w3m \
        youtube-dl

    # Manual install: archey
    git clone https://github.com/HorlogeSkynet/Archey4.git /tmp/archey4
    chmod +x /tmp/archey4/archey
    sudo cp /tmp/archey4/archey /usr/bin/archey

    # Manual install: bat
    curl -L https://github.com/sharkdp/bat/releases/download/v0.8.0/bat_0.8.0_amd64.deb -o /tmp/bat.deb && sudo dpkg -i /tmp/bat.deb

    # Manual install: jenv
    rm -rf ~/.jenv
    git clone https://github.com/gcuisinier/jenv.git ~/.jenv

    # Manual install: ticker
    curl -Ls https://api.github.com/repos/achannarasappa/ticker/releases/latest \
        | grep -wo "https.*linux-amd64*.tar.gz" \
        | wget -qi - \
        && tar -xf ticker*.tar.gz \
        && chmod +x ./ticker \
        && sudo mv ticker /usr/local/bin/

fi

############################################
# OhMyZsh
############################################
# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


############################################
# Vim
############################################
# Install vim configuration
printf "\n\nInstalling vim config...\n"
source vim.sh


############################################
# Link
############################################
# Link dot files
printf "Linking dotfiles... \n"
ln -sf ${REPO_DIR}/aliases ~/.aliases
ln -sf ${REPO_DIR}/environment ~/.environment
ln -sf ${REPO_DIR}/functions ~/.functions
ln -sf ${REPO_DIR}/gitconfig ~/.gitconfig
ln -sf ${REPO_DIR}/motd ~/.motd
ln -sf ${REPO_DIR}/screenrc ~/.screenrc
ln -sf ${REPO_DIR}/vimrc ~/.vimrc
ln -sf ${REPO_DIR}/zshrc ~/.zshrc

# Link config files
ln -sf ${REPO_DIR}/p10k.zsh ~/.p10k.zsh

mkdir -p ~/.config/archey4
ln -sf ${REPO_DIR}/config/archey4/config.json ~/.config/archey4/config.json

# Reload the terminal
source ~/.zshrc



