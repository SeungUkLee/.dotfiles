#-------------------------------------------------------------------------------
# neovim
#-------------------------------------------------------------------------------

set -x EDITOR /usr/local/bin/nvim

#-------------------------------------------------------------------------------
# GPG
# @see https://github.com/keybase/keybase-issues/issues/2798
#-------------------------------------------------------------------------------

set -gx GPG_TTY (tty)

#-------------------------------------------------------------------------------
# fzf
#-------------------------------------------------------------------------------

set -x FZF_DEFAULT_COMMAND 'rg --files'
set -x FZF_DEFAULT_OPTS '-m --height 50% --border'

#-------------------------------------------------------------------------------
# colored man output
# @see http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
#-------------------------------------------------------------------------------

set -gx LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
set -gx LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
set -gx LESS_TERMCAP_me \e'[0m'           # end mode
set -gx LESS_TERMCAP_se \e'[0m'           # end standout-mode
set -gx LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
set -gx LESS_TERMCAP_ue \e'[0m'           # end underline
set -gx LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline
