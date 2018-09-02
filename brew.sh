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

# Misc
brew install graphviz

# Install applications via brew cask
brew tap caskroom/versions

# Applications
brew cask install atom
brew cask install firefox
brew cask install get-lyrical
brew cask install github-desktop
brew cask install google-chrome
brew cask install google-cloud-sdk
brew cask install filezilla
brew cask install kaleidoscope
brew cask install marked
brew cask install mongochef
brew cask install mplayerx
brew cask install sourcetree
brew cask install sublime-text
brew cask install the-unarchiver
brew cask install virtualbox
brew cask install visual-studio-code
brew cask install wireshark

# Quicklook Plugins
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install qlprettypatch
brew cask install quicklook-csv
brew cask install betterzipql
brew cask install qlimagesize
brew cask install webpquicklook
brew cask install suspicious-package






