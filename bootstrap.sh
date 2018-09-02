#!/bin/sh

# Change the directory to the dotfiles repository
cd "$(dirname "${BASH_SOURCE}")";

# Set the repo directory variable
REPO_DIR=`pwd`

# Get the lastest version of the repo
printf "Getting lastest version of repo...\n"
git pull origin master

# Retrieve the operating system information
OS=`uname`

# OSX specific configurations
if [[ "$OS" == 'Darwin' ]]; then
    # Install homebrew and packages
    printf "\n\nInstalling Homebrew packages...\n"
    source brew.sh
fi

# Install npm packages
printf "\n\nInstalling npm packages...\n"
source npm.sh

# Install the shell
source shell.sh

# Add a job to synch settings to the repo every night. Only add
# the job if it does not already exist so the script is rerunnable.
crontab -l | grep -q dotfiles/synch.sh
if [[ $? == 1  ]]
then
    JOB="0 0 * * * .${REPO_DIR}/synch.sh"
    (crontab -l 2>/dev/null; echo "${JOB}") | crontab -
fi




