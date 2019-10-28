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
                  # start tmux forcing 256 color and enable unicode characters
                  tmux -2u
            fi
      fi
}

set_xdg_config_path () {
      export XDG_CONFIG_HOME=$HOME/.config
}

set_up_direnv () {
      # Enable direnv
      eval "$(direnv hook zsh)"
}

set_up_fzf () {
      [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

set_up_pyenv () {
      eval "$(pyenv init -)"
      export PYENV_ROOT="$HOME/.pyenv"
      export PATH="$PYENV_ROOT/bin:$PATH"
}

add_poetry_to_path () {
      export PATH="$HOME/.poetry/bin:$PATH"
}

add_local_bin_to_path () {
      export PATH="$PATH:$HOME/.local/bin"
}

# entering a directory automatically changes to that directory
setopt auto_cd

set_up_antigen

# correct typos. ignore `git status` because there is some glitch
setopt correctall
alias make='nocorrect make'
alias git='nocorrect git'
alias rg='nocorrect rg'

alias_nvim
set_xdg_config_path
set_up_direnv
add_poetry_to_path
add_local_bin_to_path
set_up_pyenv
set_up_fzf

execute_tmux
