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
#  OhMyZsh
#  -------
#  This configuration leverages OhMyZsh to manage package and zsh 
#  configuration.
#  https://github.com/ohmyzsh/ohmyzsh
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
#  OhMyZsh Configuration
#  https://github.com/ohmyzsh/ohmyzsh
####################################################

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  bazel
  brew
  colored-man-pages
  colorize
  command-not-found
  extract
  gcloud
  git
  git-auto-fetch
  git-extras
  gitignore
  golang
  httpie
  jenv
  macos
  mvn
  node
  npm
  pip
  terraform
  tig
  web-search
  z
  zsh-autosuggestions
  zsh-history-substring-search
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Auto-suggest highlight customization
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Auto-suggest key binding
bindkey '^ ' autosuggest-accept # Use Ctrl-space for autosuggestions


####################################################
#  OS Configuration
####################################################
# Install the following plugins depending on which OS is zsh is running on.
# Retrieve the operating system information.
OS=`uname`


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

# Configure iTerm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Add homebrew completions
fpath+=$(brew --prefix)/share/zsh/site-functions

####################################################
#  MOTD
####################################################
source ~/.motd



