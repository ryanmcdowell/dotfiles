#!/bin/sh

# Profiling
#
# Uncomment the following command to profile the zshrc
# startup. Then uncomment the zprof command at the end of the file.
# zmodload zsh/zprof

# Path updates
source ~/.exports

# Install zplug if not yet installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
fi

# Load zplug For Plugin Management
source ~/.zplug/init.zsh

# Plugins
# Requires psutil. pip install --user psutil
zplug "paulmelnikow/zsh-startup-timer"
zplug "plugins/bower", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh, lazy:true
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/gitignore", from:oh-my-zsh
zplug "plugins/httpie", from:oh-my-zsh
zplug "plugins/marked2", from:oh-my-zsh
zplug "plugins/mvn", from:oh-my-zsh
zplug "plugins/node", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/sublime", from:oh-my-zsh
zplug "plugins/tig", from:oh-my-zsh
zplug "plugins/web-search", from:oh-my-zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"

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
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme, as:theme


# Retrieve the operating system information.
OS=`uname`

if [[ "$OS" == 'Darwin' ]]; then
    # OSX specific plugins
    zplug "plugins/brew", from:oh-my-zsh, lazy:true
    zplug "plugins/brew-cask", from:oh-my-zsh
    zplug "plugins/osx", from:oh-my-zsh

    # Updates PATH for the Google Cloud SDK.
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'

    # Enables shell command completion for gcloud.
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi

# Tell zplug that you're done.
zplug load

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
