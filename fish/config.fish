source ~/.config/fish/aliases.fish
source ~/.config/fish/path.fish
source ~/.config/fish/export.fish
source ~/.config/fish/functions.fish

#-------------------------------------------------------------------------------
# starship config
#-------------------------------------------------------------------------------

starship init fish | source

#-------------------------------------------------------------------------------
# zoxide config
#-------------------------------------------------------------------------------

# zoxide init fish | source

#-------------------------------------------------------------------------------
# asdf config
# "echo -e "\nsource "(brew --prefix asdf)"/libexec/asdf.fish" >> ~/.config/fish/config.fish: excution result
# @see Fish & Homebrew tab in "https://asdf-vm.com/guide/getting-started.html#_3-install-asdf"
#-------------------------------------------------------------------------------

# source (brew --prefix asdf)/asdf.fish
source (brew --prefix asdf)/libexec/asdf.fish


#-------------------------------------------------------------------------------
# ghcup config
#-------------------------------------------------------------------------------
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /Users/seunguk/.ghcup/bin $PATH # ghcup-env

#-------------------------------------------------------------------------------
# JAVA_HOME using Coursier
#-------------------------------------------------------------------------------
eval "$(cs java --jvm adopt:11 --env)"

#-------------------------------------------------------------------------------
# opam configuration
#-------------------------------------------------------------------------------
source /Users/seunguk/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

#-------------------------------------------------------------------------------
# rbenv
#-------------------------------------------------------------------------------
status --is-interactive; and rbenv init - fish | source
