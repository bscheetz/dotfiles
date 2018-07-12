# for zshell
autoload colors zsh/terminfo
colors
precmd() { print "" }
PS1="⟩"
RPS1="%{$fg[magenta]%}%20<...<%~%<<%{$reset_color%}"

# entering a directory automatically changes to that directory
setopt auto_cd

# ZSH package manager
source ~/.antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting # syntax highlighting for shell
antigen bundle git # git shorthand
antigen bundle zsh-users/zsh-autosuggestions # code complete for shell
antigen theme pure
antigen apply

# correct typos. ignore `git status` because there is some glitch
setopt correctall
alias git status='nocorrect git status'

# FOR ANY SHELL
export PATH="$PATH:$HOME/.local/bin:$HOME/miniconda/bin"
export PYTHON3PATH="$(which python3)"

if type nvim > /dev/null 2>&1; then
      alias vi='nvim'
fi

export XDG_CONFIG_HOME=$HOME/.config


# autostart tmux if it exists
if [ "$TMUX" = "" ]; then tmux; fi
