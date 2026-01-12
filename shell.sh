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

    # Install nerd fonts so powerline icons properly display in the shell
    brew tap homebrew/cask-fonts
    brew install font-3270-nerd-font
    brew install font-agave-nerd-font
    brew install font-anonymice-nerd-font
    brew install font-arimo-nerd-font
    brew install font-aurulent-nerd-font
    brew install font-aurulent-sans-mono-nerd-font
    brew install font-awesome-terminal-fonts
    brew install font-bigblue-terminal-nerd-font
    brew install font-bitstream-vera-sans-mono-nerd-font
    brew install font-blex-mono-nerd-font
    brew install font-caskaydia-cove-nerd-font
    brew install font-code-new-roman-nerd-font
    brew install font-comic-shanns-mono-nerd-font
    brew install font-cousine-nerd-font
    brew install font-daddy-time-mono-nerd-font
    brew install font-dejavu-sans-mono-nerd-font
    brew install font-droid-sans-mono-nerd-font
    brew install font-fantasque-sans-mono-nerd-font
    brew install font-fira-code-nerd-font
    brew install font-fira-mono-nerd-font
    brew install font-firgenerd
    brew install font-go-mono-nerd-font
    brew install font-gohufont-nerd-font
    brew install font-hack-nerd-font
    brew install font-hackgen-nerd
    brew install font-hasklug-nerd-font
    brew install font-heavy-data-nerd-font
    brew install font-hurmit-nerd-font
    brew install font-im-writing-nerd-font
    brew install font-inconsolata-go-nerd-font
    brew install font-inconsolata-lgc-nerd-font
    brew install font-inconsolata-nerd-font
    brew install font-iosevka-nerd-font
    brew install font-iosevka-term-nerd-font
    brew install font-jetbrains-mono-nerd-font
    brew install font-lekton-nerd-font
    brew install font-liberation-nerd-font
    brew install font-lilex-nerd-font
    brew install font-meslo-lg-nerd-font
    brew install font-monocraft-nerd-font
    brew install font-monofur-nerd-font
    brew install font-monoid-nerd-font
    brew install font-mononoki-nerd-font
    brew install font-mplus-nerd-font
    brew install font-noto-nerd-font
    brew install font-open-dyslexic-nerd-font
    brew install font-overpass-nerd-font
    brew install font-profont-nerd-font
    brew install font-proggy-clean-tt-nerd-font
    brew install font-roboto-mono-nerd-font
    brew install font-sauce-code-pro-nerd-font
    brew install font-shure-tech-mono-nerd-font
    brew install font-space-mono-nerd-font
    brew install font-symbols-only-nerd-font
    brew install font-terminess-ttf-nerd-font
    brew install font-tinos-nerd-font
    brew install font-ubuntu-mono-nerd-font
    brew install font-ubuntu-nerd-font
    brew install font-victor-mono-nerd-font

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
# GitHub
############################################
# 1. Generate the key (if it doesn't exist)
if [ ! -f ~/.ssh/id_ed25519 ]; then
    ssh-keygen -t ed25519 -C "me@ryanmcdowell.io" -N "" -f ~/.ssh/id_ed25519
fi

# 2. Start the agent and add the key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# 3. Use GH CLI to add the public key to your account
gh auth login
gh ssh-key add ~/.ssh/id_ed25519.pub --title "$(hostname)-$(date +'%Y-%m-%d')"

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



