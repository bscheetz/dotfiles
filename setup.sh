#!/bin/bash
if [ "$(uname)" = "Linux" ]; then
    apt-get install ctags
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install neovim
elif [ "$(uname)" = "Darwin" ]; then
    brew install ctags
    brew install neovim
fi

str="alias vi='nvim'"

# add lines to .bashrc if .bashrc doesn't already contain them
if [ ! -f ~/.bashrc ]; then
    cp .bashrc ~/.bashrc
elif grep "$str" ~/.bashrc > /dev/null; then
    echo "FOUND"
else
    cat .bashrc >> ~/.bashrc
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
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd $HOME/.vim/bundle/

git clone https://github.com/altercation/vim-colors-solarized
git clone https://github.com/bling/vim-airline
git clone https://github.com/unblevable/quick-scope
git clone https://github.com/ervandew/supertab
git clone https://github.com/majutsushi/tagbar
git clone https://github.com/vim-airline/vim-airline-themes
git clone --recursive https://github.com/davidhalter/jedi-vim
git clone https://github.com/tpope/vim-sleuth
git clone https://github.com/w0rp/ale

pip install jedi
pip install neovim
pip install pylint
