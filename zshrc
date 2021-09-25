#!/bin/sh

########################################################################
#  Zsh Configuration
#
#  Configures zsh with custom paths, aliases, plugins, and other
#  configuration.
#
#  Installation
#  ------------
#  If zsh has not been installed yet, run the
#  following commands to install zsh via brew:
#
#  brew install zsh
#  sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
#
#
#  Parts of this configuration will depend on packages being
#  installed prior to loading. It's recommended to execute shell.sh
#  to install and link the appropriate files.
#  https://github.com/ryanmcdowell/dotfiles/blob/master/shell.sh
#
#
#  Plugins
#  -------
#  This configuration will automatically install zinit to manage
#  shell plugins. Zinit was chosen as the plugin manager due to
#  speed and community activity as of 2021-07-01.
#
#  More info:
#  https://github.com/zdharma/zinit
#
########################################################################


####################################################
#  Environment
####################################################
source ~/.environment

unsetopt menu_complete       # Do not autoselect the first completion entry

setopt always_to_end         # Move cursor to end if word had one match
setopt auto_cd               # cd by typing directory name if it's not a command
setopt auto_list             # Automatically list choices on ambiguous completion
setopt auto_menu             # Automatically use menu completion
setopt correct_all           # Autocorrect commands
setopt extended_history      # Record timestamp of command in HISTFILE
setopt hist_ignore_all_dups  # Remove older duplicate entries from history
setopt hist_reduce_blanks    # Remove superfluous blanks from history items
setopt inc_append_history    # Save history entries as soon as they are entered
setopt share_history         # Share history between different instances of the shell

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000


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

# Auto-suggest highlight customization
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Auto-suggest key binding
bindkey '^ ' autosuggest-accept # Use Ctrl-space for autosuggestions

# Oh My Zsh Plugins
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
zinit wait lucid for \
    OMZ::plugins/bower/bower.plugin.zsh \
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
        OMZ::plugins/brew/brew.plugin.zsh \
        OMZ::plugins/iterm2/iterm2.plugin.zsh

fi


####################################################
#  Theme
#  https://github.com/romkatv/powerlevel10k
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


