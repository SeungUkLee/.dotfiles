set -gx GPG_TTY (tty)

source ~/.config/fish/aliases.fish
source ~/.config/fish/path.fish
source ~/.config/fish/export.fish
source ~/.config/fish/functions.fish

#-------------------------------------------------------------------------------
# Path to your dotfiles installation.
#-------------------------------------------------------------------------------

set -x DOTFILES $HOME/.dotfiles

#-------------------------------------------------------------------------------
# starship config
#-------------------------------------------------------------------------------

starship init fish | source

#-------------------------------------------------------------------------------
# zoxide config
#-------------------------------------------------------------------------------

zoxide init fish | source

#-------------------------------------------------------------------------------
# asdf config
# "echo -e "\nsource "(brew --prefix asdf)"/asdf.fish" >> ~/.config/fish/config.fish" excution result
# @see https://asdf-vm.com/#/core-manage-asdf?id=add-to-your-shell
#-------------------------------------------------------------------------------

source (brew --prefix asdf)/asdf.fish

