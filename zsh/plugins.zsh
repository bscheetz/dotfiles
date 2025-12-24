# ~/dotfiles/zsh/plugins.zsh
# use antigen to manage plugins

# install antigen if missing
if [ ! -f "$HOME/.antigen.zsh" ]; then
  curl -L git.io/antigen > "$HOME/.antigen.zsh"
fi

source "$HOME/.antigen.zsh"

# source antigen configuration from .antigenrc
if [ -f "$HOME/dotfiles/.antigenrc" ]; then
  source "$HOME/dotfiles/.antigenrc"
fi
