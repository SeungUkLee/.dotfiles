#!/bin/sh

#-------------------------------------------------------------------------------
# Set temporary variable
#-------------------------------------------------------------------------------

export DOTFILES=$HOME/.dotfiles

#-------------------------------------------------------------------------------
# Update dotfiles itself first
#-------------------------------------------------------------------------------

if [ -d "$DOTFILES/.git" ]; then
  git --work-tree="$DOTFILES" --git-dir="$DOTFILES/.git" pull origin master
fi

#-------------------------------------------------------------------------------
# Check for Homebrew and install if we don't have it
#-------------------------------------------------------------------------------

if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#-------------------------------------------------------------------------------
# Update Homebrew recipes
#-------------------------------------------------------------------------------

brew update

#-------------------------------------------------------------------------------
# Install all our dependencies with bundle (See Brewfile)
#-------------------------------------------------------------------------------

brew tap homebrew/bundle
brew bundle --file=$DOTFILES/Brewfile # Install binary & applications
brew cleanup
brew cask cleanup

#-------------------------------------------------------------------------------
# Install global Git configuration
#-------------------------------------------------------------------------------

ln -nfs $DOTFILES/.gitconfig $HOME/.gitconfig

read -p "Enter your git username: " git_username
read -p "Enter your e-mail: " git_email
read -p "Enter your GPG key ID: " git_sign_key

git config --global core.excludesfile $DOTFILES/.gitignore_global
git config --global user.name $git_username
git config --global user.email $git_email
git config --global user.signingkey $git_sign_key
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global rebase.autoStash true

#-------------------------------------------------------------------------------
# Make ZSH the default shell environment
#-------------------------------------------------------------------------------

chsh -s $(which zsh)

#-------------------------------------------------------------------------------
# Install Oh-my-zsh
#-------------------------------------------------------------------------------

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#-------------------------------------------------------------------------------
# Install zsh plugin
#-------------------------------------------------------------------------------

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

#-------------------------------------------------------------------------------
# Source profile
#-------------------------------------------------------------------------------

ln -nfs $DOTFILES/.zshrc $HOME/.zshrc
source $HOME/.zshrc

#-------------------------------------------------------------------------------
# gpg-agent
# @see https://github.com/pstadler/keybase-gpg-github#method-2---gpg-suite
#-------------------------------------------------------------------------------

mkdir -p $HOME/.gnupg && cp $DOTFILES/gpg-agent.conf ~/.gnupg

#-------------------------------------------------------------------------------
# Starship config
#-------------------------------------------------------------------------------

ln -sfn $DOTFILES/starship.toml $HOME/.config/starship.toml

#-------------------------------------------------------------------------------
# Set OS X preferences
# We will run this last because this will reload the shell
# Fix backtick(`) issue @see https://ani2life.com/wp/?p=1753
#-------------------------------------------------------------------------------

#if [[ ! -d $HOME/Library/KeyBindings ]]; then
#    mkdir -p $HOME/Library/KeyBindings
#fi
#cp $DOTFILES/mac/DefaultkeyBinding.dict

#source $DOTFILES/.osx
