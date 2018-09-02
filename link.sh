#!/bin/sh

# Change the directory to the dotfiles repository
cd "$(dirname "${BASH_SOURCE}")";

# Set the repo directory variable
REPO_DIR=`pwd`

printf "Linking dotfiles... \n"
ln -sf ${REPO_DIR}/aliases ~/.aliases
ln -sf ${REPO_DIR}/exports ~/.exports
ln -sf ${REPO_DIR}/functions ~/.functions
ln -sf ${REPO_DIR}/gitconfig ~/.gitconfig
ln -sf ${REPO_DIR}/motd ~/.motd
ln -sf ${REPO_DIR}/screenrc ~/.screenrc
ln -sf ${REPO_DIR}/vimrc ~/.vimrc
ln -sf ${REPO_DIR}/zshrc ~/.zshrc
ln -sf ${REPO_DIR}/custom.zsh-theme ~/.oh-my-zsh/themes/custom.zsh-theme
