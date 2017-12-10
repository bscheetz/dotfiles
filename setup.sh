#!/bin/bash
if [ "$(uname)" = "Linux" ]; then
    sudo apt-get install zsh
    sudo apt-get install ctags
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install neovim
    sudo apt-get install zsh-antigen

    #bashfile=".bashrc"

elif [ "$(uname)" = "Darwin" ]; then
    brew install zsh
    brew install ctags 
    brew install neovim
    brew install antigen

    #bashfile=".bash_profile"
fi

bashfile=".zshrc"

str="alias vi='nvim'"

# add lines to .bashrc if .bashrc doesn't already contain them
if [ ! -f ~/$bashfile ]; then
    cp .bashrc ~/$bashfile
elif grep "$str" ~/$bashfile > /dev/null; then
    echo "FOUND"
else
    cat .bashrc >> ~/$bashfile
fi

# zsh package manager
if [[ ! -f ~/.antigen.zsh ]]; then
    if [ "$(uname)" = "Darwin" ]; then
        cat "source /usr/local/share/antigen/antigen.zsh" > ~/.antigen.zsh
    elif [ "$(uname)" = "Linux" ]; then
        cat "source /usr/share/zsh-antigen/antigen.zsh" > ~/.antigen.zsh
    fi
fi

# set XDG_CONFIG_HOME if it's not already set
if [ ! $XDG_CONFIG_HOME ]; then
    mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
fi

cp .vimrc $HOME
mkdir -p $XDG_CONFIG_HOME/nvim/
cp init.vim $XDG_CONFIG_HOME/nvim/

cp .tmux.conf $HOME

cd ~
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone --depth 1 https://github.com/junegunn/fzf ~/.fzf
~/.fzf/install

git clone --depth 1 https://github.com/powerline/fonts
cd fonts
./install.sh
cd ..
rm -rf fonts

git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

pip install jedi
pip install neovim
pip install pylint
