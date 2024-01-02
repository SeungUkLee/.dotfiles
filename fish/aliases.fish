abbr -a v nvim
abbr -a g git
abbr -a gst 'git status'
abbr -a vimdiff 'nvim -d'
abbr -a rr '. ~/.config/fish/config.fish'
abbr -a cls clear
abbr -a til 'code $HOME/Documents/Github/TIL'
abbr -a ex exercism

if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
    abbr -a tree "eza -TL"
end

# alias vi nvim
alias vim nvim
alias cat 'bat --theme=(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub)'
alias ghpv 'gh issue list | fzf | awk '\''{print $1}'\'' | xargs gh issue view'
alias ghiv 'gh pr list | fzf | awk '\''{print $1}'\'' | xargs gh pr view'
alias mv 'mv -i'
alias rm 'rm -i'
alias cp 'cp -i'
alias gitlog 'git log --decorate=full --graph --stat'
