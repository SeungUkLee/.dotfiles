#-------------------------------------------------------------------------------
# Path to your dotfiles installation.
#-------------------------------------------------------------------------------

export DOTFILES=$HOME/.dotfiles

#-------------------------------------------------------------------------------
# Path to your oh-my-zsh installation.
#-------------------------------------------------------------------------------

export ZSH=/Users/SeungUk/.oh-my-zsh

#-------------------------------------------------------------------------------
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#-------------------------------------------------------------------------------

plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-completions)

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

files=("$DOTFILES/export.sh" "$DOTFILES/path.sh" "$DOTFILES/aliases.sh" "$DOTFILES/functions.sh");

for file in "${files[@]}"; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

unset files file;

#-------------------------------------------------------------------------------
# starship shell prompt
#-------------------------------------------------------------------------------

eval "$(starship init zsh)"

#-------------------------------------------------------------------------------
# asdf config
# "echo -e '\n. $(brew --prefix asdf)/asdf.sh' >> ~/.zshrc" execution result
# @see https://github.com/asdf-vm/asdf/issues/428#issuecomment-507058409
#-------------------------------------------------------------------------------

. $(brew --prefix asdf)/asdf.sh

#-------------------------------------------------------------------------------
# fzf
# To install useful key bindings and fuzzy completion
# "$(brew --prefix)/opt/fzf/install" execution result
# @see https://github.com/junegunn/fzf#using-homebrew-or-linuxbrew
#-------------------------------------------------------------------------------

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#-------------------------------------------------------------------------------
# zoxide
#-------------------------------------------------------------------------------

eval "$(zoxide init zsh)"
