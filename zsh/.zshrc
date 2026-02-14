# If not running interactively, don't do anything
[[ -o interactive ]] || return

# There configs should be set before p10k instant prompt
stty stop undef 	# disable Ctrl-S
export GPG_TTY=$(tty)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Homebrewe auto completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit ice depth=1
zinit light romkatv/powerlevel10k
# zinit snippet https://github.com/sainnhe/dotfiles/raw/master/.zsh-theme/gruvbox-material-dark.zsh
# zinit snippet https://github.com/sainnhe/dotfiles/raw/master/.zsh-theme/gruvbox-mix-dark.zsh

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
 atload"bindkey '^P' history-substring-search-up; \
			bindkey '^N' history-substring-search-down" \
		zsh-users/zsh-history-substring-search

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# FZF (brew)
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_OPTS='-m --height 50% --border'
export FZF_COMPLETION_TRIGGER="**"

# GHCup
[ -f "/Users/seunguk/.ghcup/env" ] && . "/Users/seunguk/.ghcup/env"

# asdf version manager (asdf-vm)
export ASDF_HOME="$(brew --prefix asdf)"
source "$ASDF_HOME/libexec/asdf.sh"

# .dotfiles
export DOTFILES=$HOME/.dotfiles

# tmux
export PATH="$HOME/bin:$PATH" # for custom command

# locale
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# workdir
export WORKDIR="$HOME/Workspace"

# alias
if (( $+commands[bat] )); then
  alias bat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub)"
fi

if (( $+commands[gh] )); then
  alias ghpv="gh issue list | fzf | awk '{print \$1}' | xargs gh issue view"
  alias ghiv="gh pr list | fzf | awk '{print \$1}' | xargs gh issue view"
fi

if (( $+commands[lsd] )); then
  alias l='lsd'
  alias ls='lsd'
  alias ll='lsd -l'
  alias lla='lsd -Al'
  alias lt='lsd --tree --depth=2'
else
  alias l='ls -alh'
  alias ll='ls -lh'
fi

# @see https://github.com/simnalamburt/.dotfiles/blob/d938a80a3a12cafe6ddf11ad564a2fbc29c86f0e/.zshrc#L76-L89
if (( $+commands[nvim] )); then
  export EDITOR=nvim
  alias vim="nvim"
  alias vimdiff="nvim -d"
elif (( $+commands[vim] )); then
  export EDITOR=vim
fi
bindkey -e

alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias ..='cd ..'
alias ...='cd ../..'
alias brewu='brew upgrade; brew cleanup'

HISTSIZE=90000
SAVEHIST=90000
HISTFILE=~/.zsh_history

setopt auto_cd histignorealldups sharehistory
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
# Substring completion
# for example, if you input "sdf", items such as "asdf" will all appear as auto complete candidates.
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

#
# zsh-substring-completion
#
# @see https://zsh.sourceforge.io/FAQ/zshfaq04.html
setopt complete_in_word    # Complete from both ends of a word. 
setopt always_to_end       # Move cursor to the end of a completed word.
# @see https://github.com/ohmyzsh/ohmyzsh/issues/6948#issuecomment-400287939
WORDCHARS=''
zmodload -i zsh/complist

# Disable highlight when pasted text
# @see https://github.com/zsh-users/zsh-syntax-highlighting/issues/349#issuecomment-238505665
zle_highlight+=('paste:none')

# curl
PATH="/opt/homebrew/opt/curl/bin:$PATH" 
FPATH="/opt/homebrew/opt/curl/share/zsh/site-functions:$FPATH" # for zsh completions

fpath=(~/.zsh/completion $fpath)


source /Users/seunguk/.config/broot/launcher/bash/br
