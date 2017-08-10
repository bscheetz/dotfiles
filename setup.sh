#!/bin/bash
apt-get install ctags
cp .vimrc ~/

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
