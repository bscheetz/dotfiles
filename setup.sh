#!/bin/bash
if [ "$(uname)" = "Linux" ]; then
    apt-get install ctags
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install neovim

    bashfile=".bashrc"

elif [ "$(uname)" = "Darwin" ]; then
    brew install ctags
    brew install neovim

    bashfile=".bash_profile"
fi

str="alias vi='nvim'"

# add lines to .bashrc if .bashrc doesn't already contain them
if [ ! -f ~/$bashfile ]; then
    cp .bashrc ~/$bashfile
elif grep "$str" ~/$bashfile > /dev/null; then
    echo "FOUND"
else
    cat .bashrc >> ~/$bashfile
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

git clone --depth 1 https://github.com/junegunn/fzf ~/.fzf
~/.fzf/install

cd $HOME/.vim/bundle/
# remove old bundles
rm -rf $HOME/.vim/bundle/*

git clone --depth 1 https://github.com/altercation/vim-colors-solarized
git clone --depth 1 https://github.com/bling/vim-airline
git clone --depth 1 https://github.com/unblevable/quick-scope
git clone --depth 1 https://github.com/ervandew/supertab
git clone --depth 1 https://github.com/majutsushi/tagbar
git clone --recursive --depth 1 https://github.com/davidhalter/jedi-vim
git clone --depth 1 https://github.com/vim-airline/vim-airline-themes
git clone --depth 1 https://github.com/shougo/deoplete.nvim
git clone --depth 1 https://github.com/zchee/deoplete-jedi
git clone --depth 1 https://github.com/tpope/vim-sleuth
git clone --depth 1 https://github.com/w0rp/ale
git clone --depth 1 https://github.com/airblade/vim-gitgutter
git clone --depth 1 https://github.com/tpope/vim-fugitive
git clone --depth 1 https://github.com/scrooloose/nerdtree
git clone --depth 1 https://github.com/easymotion/vim-easymotion
git clone --depth 1 https://github.com/ludovicchabant/vim-gutentags
git clone --depth 1 https://github.com/nielsmadan/harlequin

pip install jedi
pip install neovim
pip install pylint
