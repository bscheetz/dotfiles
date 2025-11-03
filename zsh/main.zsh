# for zshell
autoload colors zsh/terminfo
colors
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
precmd() { print "" }
PS1="⟩"
RPS1="%{$fg[magenta]%}%20<...<%~%<<%{$reset_color%}"

plugins=(git docker docker-compose)

alias_nvim () {
      if type nvim > /dev/null 2>&1; then
            alias vi='nvim'
      fi
}

set_up_antigen () {
      # ZSH package manager
      if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi # kubectl autocomplete

      source ~/antigen.zsh
      antigen init ~/.antigenrc
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
      export PYENV_ROOT="$HOME/.pyenv"
      export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"

      eval "$(pyenv init -)"
      eval "$(pyenv virtualenv-init -)"
}

add_poetry_to_path () {
      export PATH="$HOME/.poetry/bin:$PATH"
}

add_local_bin_to_path () {
      export PATH="$PATH:$HOME/.local/bin"
}

set_up_cross_distro_mounts_wsl () {
      if [[ ! -z "${WSL_DISTRO_NAME+x}" && ! -d /mnt/wsl/home ]]; then
            # if WSL_DISTRO_NAME is set and the /mnt/wsl/home dir doesn't exist
            # create it and bind home to it
            mkdir /mnt/wsl/home
            sudo mount --bind ~ /mnt/wsl/home
      fi
}

add_vue_cli_to_path () {
      export PATH=~/.npm-global/bin:$PATH
}

set_up_cuda () {
      if [[ ! -z "${WSL_DISTRO_NAME+x}" ]]; then
            export PATH="/usr/local/cuda-12/bin:$PATH"
            #export LD_LIBRARY_PATH=/usr/local/cuda-12/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
      fi
}

set_up_nvm () {
      export NVM_DIR="$HOME/.config/nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
      [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
      nvm use &> /dev/null
}

set_up_autocomplete () {
    source <(kubectl completion zsh)
    source <(docker completion zsh)
}

add_cargo_to_path () {
    export PATH=$PATH:/home/ben/.cargo/bin
}

# entering a directory automatically changes to that directory
setopt auto_cd

set_up_antigen

# enable vim mode
bindkey -v
# correct typos. ignore `git status` because there is some glitch
setopt correctall
alias make='nocorrect make'
alias git='nocorrect git'
alias rg='nocorrect rg'
alias kb='kubectl'

alias_nvim
set_xdg_config_path
set_up_direnv
set_up_cross_distro_mounts_wsl
add_poetry_to_path
add_local_bin_to_path
add_vue_cli_to_path
set_up_pyenv
set_up_fzf
set_up_cuda
set_up_nvm
set_up_autocomplete
add_cargo_to_path

execute_tmux
