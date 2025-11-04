setopt correctall

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'

alias make='nocorrect make'
alias git='nocorrect git'
alias rg='nocorrect rg'
alias kb='kubectl'

if type nvim > /dev/null 2>&1; then
      alias vi='nvim'
fi
