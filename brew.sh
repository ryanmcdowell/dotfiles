#!/bin/sh

# Prompt for sudo password if user hasn't sudo'd recently
sudo -v

# Check if Homebrew is installed.
which -s brew
if [[ $? != 0 ]]
then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    # Update Brew to latest version
    brew update

    # Update any existing packages
    brew upgrade
fi

# Install the coreutils package to use more up-to-date system utilities.
# Be sure to link the PATH and MANPATH in the zshrc
#   PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
#   MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
brew install coreutils

# Languages
brew install java
brew install jenv # Virtual env for java
brew install go
brew install groovy
brew install node
brew install python && easy_install pip
brew install ruby
brew install scala
brew install sisc-scheme

# Databases
brew install cassandra
brew install hadoop
brew install mongodb
brew install neo4j
brew install redis
brew install sqlite

# DevOps
brew install ant
brew install docker
brew install boot2docker
brew install gradle
brew install maven
brew install terraform

# Data Format
brew install protobuf

# Misc
brew install ffmpeg
brew install gh
brew install graphviz
brew install youtube-dl

# Applications
brew install --cask atom
brew install --cask firefox
brew install --cask get-lyrical
brew install --cask github-desktop
brew install --cask google-chrome
brew install --cask google-cloud-sdk
brew install --cask filezilla
brew install --cask kaleidoscope
brew install --cask marked
brew install --cask mongochef
brew install --cask mplayerx
brew install --cask sourcetree
brew install --cask sublime-text
brew install --cask the-unarchiver
brew install --cask virtualbox
brew install --cask visual-studio-code
brew install --cask wireshark

# Quicklook Plugins
brew install --cask qlcolorcode
brew install --cask qlstephen
brew install --cask qlmarkdown
brew install --cask quicklook-json
brew install --cask qlprettypatch
brew install --cask quicklook-csv
brew install --cask betterzipql
brew install --cask qlimagesize
brew install --cask webpquicklook
brew install --cask suspicious-package






