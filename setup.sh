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

cp .vimrc ~/
mkdir -p ~/.config/nvim/
cp init.vim ~/.config/nvim/

cd ~
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle && git clone --depth=1 https://github.com/vim-syntastic/syntastic.git

git clone https://github.com/altercation/vim-colors-solarized
git clone https://github.com/bling/vim-airline
git clone https://github.com/unblevable/quick-scope
git clone https://github.com/ervandew/supertab
git clone https://github.com/majutsushi/tagbar
git clone https://github.com/vim-airline/vim-airline-themes
git clone --recursive https://github.com/davidhalter/jedi-vim

pip install jedi
