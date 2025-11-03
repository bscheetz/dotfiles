# ~/dotfiles/zsh/plugins.zsh
# use antigen to manage plugins

# install antigen if missing
if [ ! -f "$HOME/.antigen.zsh" ]; then
  curl -L git.io/antigen > "$HOME/.antigen.zsh"
fi

source "$HOME/.antigen.zsh"

antigen use oh-my-zsh

# your typical stack
antigen bundle git
antigen bundle docker
antigen bundle docker-compose
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# you can add your ~/.antigenrc later if you want to keep it separate

antigen theme robbyrussell
antigen apply
