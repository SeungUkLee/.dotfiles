#-------------------------------------------------------------------------------
# Neovim settings
#-------------------------------------------------------------------------------

alias vim='nvim'
alias vi='nvim'
alias vimdiff='nvim -d'

#-------------------------------------------------------------------------------
# CLI Shortcuts
#-------------------------------------------------------------------------------

alias rr='source $HOME/.zshrc'
alias cat='bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub)'
alias cls='clear'
alias til='code $HOME/Documents/Github/TIL'
alias ls='exa -h --icons'

#-------------------------------------------------------------------------------
# Github CLI Shortcuts
#-------------------------------------------------------------------------------

alias ghpv='gh issue list | fzf | awk '\''{print $1}'\'' | xargs gh issue view'
alias ghiv='gh pr list | fzf | awk '\''{print $1}'\'' | xargs gh pr view'
