# ~/dotfiles/zsh/plugins.zsh
# use antigen to manage plugins

# install antigen if missing
if [ ! -f "$HOME/.antigen.zsh" ]; then
  curl -L git.io/antigen > "$HOME/.antigen.zsh"
fi

source "$HOME/.antigen.zsh"

# set theme BEFORE loading oh-my-zsh
export ZSH_THEME="refined"

antigen use oh-my-zsh

# bundles
antigen bundle git
antigen bundle docker
antigen bundle docker-compose
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply
