#!/bin/sh

# Change the directory to the dotfiles repository
cd "$(dirname "${BASH_SOURCE}")";

# Sublime Settings
rsync -avrz --progress /Users/${USER}/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/*-settings config/sublime-text3/
