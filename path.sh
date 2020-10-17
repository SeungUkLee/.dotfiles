#-------------------------------------------------------------------------------
# brew doctor
# Warning: Homebrew's sbin was not found in your PATH but you have installed
# formulae that put executables in /usr/local/sbin.
# Consider setting the PATH for example like so
#-------------------------------------------------------------------------------
export PATH="/usr/local/sbin:$PATH"

#-------------------------------------------------------------------------------
# Rust
#-------------------------------------------------------------------------------

export PATH="$HOME/.cargo/bin:$PATH"

#-------------------------------------------------------------------------------
# Haskell
#-------------------------------------------------------------------------------

export PATH=$PATH:~/.local/bin

