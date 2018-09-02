#!/bin/sh

# Change the directory to the dotfiles repository
cd "$(dirname "${BASH_SOURCE}")";

# Set the repo directory variable
REPO_DIR=`pwd`

# Remove the existing vundle installation (if exists)
rm -rf ~/.vim/bundle/vundle

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle

# Link the vimrc
ln -sf ${REPO_DIR}/vimrc ~/.vimrc

# Install all plugins
vim --cmd "let init=1" +PluginInstall +qall
