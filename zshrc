#!/bin/sh


####################################################
#  Path
####################################################
source ~/.exports


####################################################
#  Instant Prompt
#  https://github.com/romkatv/powerlevel10k
####################################################
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


####################################################
#  Zinit Install
#  https://github.com/zdharma/zinit
####################################################
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk


####################################################
#  Zinit Plugins
####################################################
zinit light-mode for \
    zsh-users/zsh-syntax-highlighting \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-history-substring-search

# Auto suggest highlight customization
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Key bindings
bindkey '^ ' autosuggest-accept # Use Ctrl-space for autosuggestions

# Oh My Zsh Plugins
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
zinit wait lucid for \
    OMZ::plugins/bower/bower.plugin.zsh \
    OMZ::plugins/brew/brew.plugin.zsh \
    OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh \
    OMZ::plugins/colorize/colorize.plugin.zsh \
    OMZ::plugins/command-not-found/command-not-found.plugin.zsh \
    OMZ::plugins/extract/extract.plugin.zsh \
    OMZ::plugins/gcloud/gcloud.plugin.zsh \
    OMZ::plugins/git-auto-fetch/git-auto-fetch.plugin.zsh \
    OMZ::plugins/git/git.plugin.zsh \
    OMZ::plugins/gitignore/gitignore.plugin.zsh \
    OMZ::plugins/git-extras/git-extras.plugin.zsh \
    OMZ::plugins/gitignore/gitignore.plugin.zsh \
    OMZ::plugins/golang/golang.plugin.zsh \
    OMZ::plugins/iterm2/iterm2.plugin.zsh \
    OMZ::plugins/httpie/httpie.plugin.zsh \
    OMZ::plugins/jenv/jenv.plugin.zsh \
    OMZ::plugins/mvn/mvn.plugin.zsh \
    OMZ::plugins/node/node.plugin.zsh \
    OMZ::plugins/npm/npm.plugin.zsh \
    OMZ::plugins/pip/pip.plugin.zsh \
    OMZ::plugins/terraform/terraform.plugin.zsh \
    OMZ::plugins/tig/tig.plugin.zsh \
    OMZ::plugins/web-search/web-search.plugin.zsh


####################################################
#  OS Configuration
####################################################
# Install the following plugins depending on which OS is zsh is running on.
# Retrieve the operating system information.
OS=`uname`

if [[ "$OS" == 'Darwin' ]]; then
    # OSX specific plugins
    zinit wait lucid for \
        OMZ::plugins/brew/brew.plugin.zsh

    # Updates PATH for the Google Cloud SDK.
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'

    # Enables shell command completion for gcloud.
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi


####################################################
#  Theme
####################################################
# Load powerlevel10k theme
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


####################################################
#  User Configuration
####################################################
source ~/.aliases
source ~/.functions


####################################################
#  App Configuration
####################################################
# Configure jenv.
#
# Rehash in a background process to improve startup time.
# Issue:
#   https://github.com/gcuisinier/jenv/issues/148
eval "$(jenv init - --no-rehash)"
(jenv rehash &) 2> /dev/null


####################################################
#  MOTD
####################################################
source ~/.motd


