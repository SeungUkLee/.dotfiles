#!/bin/sh

#-------------------------------------------------------------------------------
# Set temporary variable
#-------------------------------------------------------------------------------

DOTFILES=$HOME/dotfiles

#-------------------------------------------------------------------------------
# Update dotfiles itself first
#-------------------------------------------------------------------------------

[ -d "$DOTFILES/.git" ] && git --work-tree="$DOTFILES" --git-dir="$DOTFILES/.git" pull origin master

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
git config --global core.excludesfile $DOTFILES/.gitignore_global
git config --global user.name "SeungukLee"
git config --global user.email "lsy931106@gmail.com"

#-------------------------------------------------------------------------------
# Install Oh-my-zsh
#-------------------------------------------------------------------------------

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#-------------------------------------------------------------------------------
# Install pure ZSH prompt 
# ref) https://github.com/sindresorhus/pure#getting-started
#-------------------------------------------------------------------------------

mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
fpath+=("$HOME/.zsh/pure")

#-------------------------------------------------------------------------------
# Install zsh plugin
#-------------------------------------------------------------------------------

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

#-------------------------------------------------------------------------------
# Install & execute profile
#-------------------------------------------------------------------------------

# Always prefer dotfiles' .zshrc
ln -nfs $DOTFILES/.zshrc $HOME/.zshrc

#-------------------------------------------------------------------------------
# Source profile
#-------------------------------------------------------------------------------

source $HOME/.zshrc

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
