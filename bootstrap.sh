#!/bin/sh

#-------------------------------------------------------------------------------
# Set temporary variable
#-------------------------------------------------------------------------------

export DOTFILES=$HOME/.dotfiles

#-------------------------------------------------------------------------------
# Create zsh completion folder
#-------------------------------------------------------------------------------

mkdir -p ~/.zsh/completion

#-------------------------------------------------------------------------------
# Create bin folder for custom commands
#-------------------------------------------------------------------------------

mkdir -p $HOME/bin

#-------------------------------------------------------------------------------
# Install global Git configuration
#-------------------------------------------------------------------------------

ln -sf $DOTFILES/git/.gitconfig $HOME/.gitconfig
# ln -sf $DOTFILES/git/.gitalias $HOME/.gitalias
ln -s $DOTFILES/git/.gitignore_global $HOME/.gitignore_global

#-------------------------------------------------------------------------------
# gpg-agent
# @see https://github.com/pstadler/keybase-gpg-github#method-2---gpg-suite
#-------------------------------------------------------------------------------

mkdir -p $HOME/.gnupg
cp $DOTFILES/gnupg/gpg-agent.conf ~/.gnupg
gpgconf --kill gpg-agent

#-------------------------------------------------------------------------------
# Starship config
#-------------------------------------------------------------------------------

# ln -sfn $DOTFILES/starship/starship.toml $HOME/.config/starship.toml

#-------------------------------------------------------------------------------
# Neovim config
#-------------------------------------------------------------------------------

# ln -nfs $DOTFILES/nvim/init.vim $HOME/.config/nvim/init.vim
# ln -sfn $DOTFILES/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json

# mkdir -p ~/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config

ln -s $DOTFILES/vscode/init.vim $HOME

#-------------------------------------------------------------------------------
# Tmux config
#-------------------------------------------------------------------------------

ln -s $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf
chmod +x $DOTFILES/tmux/tmux-*
# ln -sfn $DOTFILES/tmux/tmux-* /usr/local/bin/
ln -s $DOTFILES/tmux/tmux-* ~/bin

#-------------------------------------------------------------------------------
# fish config
#-------------------------------------------------------------------------------

# ln -sfn $DOTFILES/fish/config.fish $HOME/.config/fish/config.fish
# ln -sfn $DOTFILES/fish/export.fish $HOME/.config/fish/export.fish
# ln -sfn $DOTFILES/fish/aliases.fish $HOME/.config/fish/aliases.fish

#-------------------------------------------------------------------------------
# Alacritty config
#-------------------------------------------------------------------------------

# ln -sfn $DOTFILES/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml

#-------------------------------------------------------------------------------
# JetBrains IDEA config
#-------------------------------------------------------------------------------

ln -sf $DOTFILES/idea/.ideavimrc $HOME/.ideavimrc

#-------------------------------------------------------------------------------
# powerlevel10k (p10k) config
#-------------------------------------------------------------------------------

ln -s $DOTFILES/p10k/.p10k.zsh $HOME/.p10k.zsh

#-------------------------------------------------------------------------------
# ZSH config
#-------------------------------------------------------------------------------

ln -s $DOTFILES/zsh/.zshrc $HOME/.zshrc

#-------------------------------------------------------------------------------
# lsd config
#-------------------------------------------------------------------------------

mkdir -p $HOME/.config/lsd
ln -s $DOTFILES/lsd/config.yaml ~/.config/lsd/config.yaml
