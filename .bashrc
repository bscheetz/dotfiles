# for zshell
autoload colors zsh/terminfo
colors
precmd() { print "" }
PS1="⟩"
RPS1="%{$fg[magenta]%}%20<...<%~%<<%{$reset_color%}"


alias_nvim () {
      if type nvim > /dev/null 2>&1; then
            alias vi='nvim'
      fi
}

set_python3_path () {
      if [ "$(uname)" = "Linux" ]; then
            export PYTHON3PATH="$HOME/miniconda3/bin/python3"
      elif [ "$(uname)" = "Darwin" ]; then
            export PYTHON3PATH="$HOME/miniconda/bin/python3"
      fi
}

set_up_antigen () {
      # ZSH package manager
      source ~/.antigen.zsh

      antigen bundle zsh-users/zsh-syntax-highlighting # syntax highlighting for shell
      antigen bundle git # git shorthand
      antigen bundle zsh-users/zsh-autosuggestions # code complete for shell
      antigen theme refined
      antigen apply
}

execute_tmux () {
      # autostart tmux if it exists
      if [ "$TMUX" = "" ]
            then
            if tmux ls > /dev/null 2>&1
                  then
                  tmux a -t $(tmux ls | sort -n | head -1 | cut -d ":" -f1)
            else
                  tmux -2
            fi
      fi
}

set_xdg_config_path () {
      export XDG_CONFIG_HOME=$HOME/.config
}

set_up_fzf () {
      [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

# entering a directory automatically changes to that directory
setopt auto_cd

set_up_antigen

# correct typos. ignore `git status` because there is some glitch
setopt correctall
alias git status='nocorrect git status'
alias rg='nocorrect rg'
alias make test='nocorrect make test'

# FOR ANY SHELL
export PATH="$PATH:$HOME/.local/bin:$HOME/miniconda/bin"

alias_nvim
set_python3_path
set_xdg_config_path
set_up_fzf

# Enable direnv
eval "$(direnv hook zsh)"

execute_tmux
