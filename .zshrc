#-------------------------------------------------------------------------------
# Path to your dotfiles installation.
#-------------------------------------------------------------------------------

export DOTFILES=$HOME/dotfiles

#-------------------------------------------------------------------------------
# Path to your oh-my-zsh installation.
#-------------------------------------------------------------------------------

export ZSH=/Users/SeungUk/.oh-my-zsh

#-------------------------------------------------------------------------------
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#-------------------------------------------------------------------------------

ZSH_THEME="robbyrussell"

#-------------------------------------------------------------------------------
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#-------------------------------------------------------------------------------

plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-completions fasd)

#-------------------------------------------------------------------------------
# zsh-completions
#-------------------------------------------------------------------------------
autoload -U compinit && compinit

#-------------------------------------------------------------------------------
# Activate Oh-My-Zsh
#-------------------------------------------------------------------------------

source $ZSH/oh-my-zsh.sh

#-------------------------------------------------------------------------------
# Default user setting
#-------------------------------------------------------------------------------

DEFAULT_USER="$USER"

#-------------------------------------------------------------------------------
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
#-------------------------------------------------------------------------------

files=("$DOTFILES/.export" "$DOTFILES/.path" "$DOTFILES/.aliases" "$DOTFILES/.functions" "$DOTFILES/.extra");

for file in "${files[@]}"; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

unset files file;

#-------------------------------------------------------------------------------
# direnv
#-------------------------------------------------------------------------------

eval "$(direnv hook zsh)"

#-------------------------------------------------------------------------------
# pyenv
#-------------------------------------------------------------------------------

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

#-------------------------------------------------------------------------------
# pyenvstarship shell prompt
#-------------------------------------------------------------------------------
eval "$(starship init zsh)"
