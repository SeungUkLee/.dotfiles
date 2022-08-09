#-------------------------------------------------------------------------------
# brew doctor
# Warning: Homebrew's sbin was not found in your PATH but you have installed
# formulae that put executables in /usr/local/sbin.
# Consider setting the PATH for example like so
#-------------------------------------------------------------------------------

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

#-------------------------------------------------------------------------------
# Haskell
#-------------------------------------------------------------------------------
set PATH ~/.local/bin $PATH

#-------------------------------------------------------------------------------
# Rust
#-------------------------------------------------------------------------------
set PATH ~/.cargo/bin $PATH

#-------------------------------------------------------------------------------
# Scala Coursier
#-------------------------------------------------------------------------------
set PATH $HOME/Library/Application\ Support/Coursier/bin $PATH

