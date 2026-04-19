# ~/dotfiles/zsh/plugins.zsh
# plugin loading via antidote (https://github.com/mattmc3/antidote)

ANTIDOTE_DIR="${ANTIDOTE_HOME:-$HOME/.antidote}"
if [ ! -d "$ANTIDOTE_DIR" ]; then
  git clone --depth 1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_DIR"
fi

source "$ANTIDOTE_DIR/antidote.zsh"
antidote load "$HOME/dotfiles/zsh/plugins.txt"
