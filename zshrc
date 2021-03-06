#!/bin/sh

# Profiling
#
# Uncomment the following command to profile the zshrc
# startup. Then uncomment the zprof command at the end of the file.
# zmodload zsh/zprof

# Path updates
source ~/.exports

# Load antigen For Plugin Management
source ~/.antigen.zsh

# Plugins
antigen bundle bower
antigen bundle colored-man-pages
antigen bundle colorize
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle docker
antigen bundle extract
antigen bundle git
antigen bundle git-extras
antigen bundle gitignore
antigen bundle httpie
antigen bundle jenv
antigen bundle marked2
antigen bundle mvn
antigen bundle node
antigen bundle npm
antigen bundle pip
antigen bundle sublime
antigen bundle tig
antigen bundle web-search
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Auto suggest customization
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

# Theme customization
DEFAULT_USER=$USER
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs)

# Newline before and move the cursor one character backwards
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="\n\e[1D"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX=" ↳  "

# Advanced `vcs` color customization
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="black"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="blue"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="black"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="yellow"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="black"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="red"

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND=""
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="8"
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="red"
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=""

# Load the theme.
antigen theme bhilburn/powerlevel9k powerlevel9k

# Retrieve the operating system information.
OS=`uname`

if [[ "$OS" == 'Darwin' ]]; then
    # OSX specific plugins
    antigen bundle brew
    antigen bundle brew-cask
    antigen bundle osx

    # Updates PATH for the Google Cloud SDK.
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'

    # Enables shell command completion for gcloud.
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
elif [[ "$OS" == 'Linux' ]]; then

fi

# Tell antigen that you're done.
antigen apply

# Key bindings
bindkey '^ ' autosuggest-accept # Use Ctrl-space for autosuggestions

# Configure jenv.
#
# Rehash in a background process to improve startup time.
# Issue:
#   https://github.com/gcuisinier/jenv/issues/148
eval "$(jenv init - --no-rehash)"
(jenv rehash &) 2> /dev/null

# User configuration
source ~/.aliases
source ~/.functions

# Display the MOTD
source ~/.motd

# Uncomment when profiling
# zprof
