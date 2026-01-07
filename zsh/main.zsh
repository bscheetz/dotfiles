# for zshell
autoload colors zsh/terminfo
colors
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
precmd() { print "" }
PS1="%{$fg[cyan]%}⟩%{$reset_color%}"
RPS1="%{$fg[magenta]%}%20<...<%~%<<%{$reset_color%}"

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

set_up_direnv () {
      # Enable direnv
      eval "$(direnv hook zsh)"
}

set_up_fzf () {
      [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

set_up_cross_distro_mounts_wsl () {
      if [[ ! -z "${WSL_DISTRO_NAME+x}" && ! -d /mnt/wsl/home ]]; then
            # if WSL_DISTRO_NAME is set and the /mnt/wsl/home dir doesn't exist
            # create it and bind home to it
            mkdir /mnt/wsl/home
            sudo mount --bind ~ /mnt/wsl/home
      fi
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

# entering a directory automatically changes to that directory
setopt auto_cd

# enable vim mode
bindkey -v

set_up_direnv
set_up_cross_distro_mounts_wsl
set_up_fzf
set_up_cuda
set_up_nvm
set_up_autocomplete

execute_tmux
