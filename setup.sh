#!/bin/bash

shell_config=".zshrc"
str="alias vi='nvim'"


install_alacritty () {
	# install alacritty
	if ! [ -x "$(command -v rustup)" ]; then
		curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
		export PATH="$PATH:$HOME/.cargo/bin"
	fi

	if ! [ -x "$(command -v alacritty)" ]; then
	    # install alacritty
	    cargo install --git https://github.com/jwilm/alacritty
	fi
}

install_pyenv () {
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv

	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"

	git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
}

install_packages () {
	if [ "$(uname)" = "Linux" ]; then
		yes '' | sudo apt-get install software-properties-common
		yes '' | sudo add-apt-repository ppa:neovim-ppa/stable
		sudo apt-get update
		yes | sudo apt-get install \
				apt-transport-https \
				ca-certificates \
				curl \
				openssl \
				libreadline-dev \
				sqlite3 \
				curl \
				zsh \
				ctags \
				neovim \
				zsh-antigen \
				cmake \
				libfreetype6-dev \
				libfontconfig1-dev \
				xclip \
				python3-pip \
				direnv \
				ripgrep

	elif [ "$(uname)" = "Darwin" ]; then
		brew install zsh ctags neovim antigen direnv ripgrep openssl readline sqlite3 xz zlib

	fi

	install_alacritty

}

construct_shell_config () {
	# add lines to shell RC file if it doesn't already contain them
	if [ ! -f ~/$shell_config ]; then
		cp .zshrc ~/$shell_config
	elif grep "$str" ~/$shell_config > /dev/null; then
		echo "FOUND"
	else
		cat .zshrc >> ~/$shell_config
	fi
}

install_antigen () {
	# zsh package manager
	curl -L git.io/antigen > ~/.antigen.zsh
}

set_xdg_config_var () {
	# set XDG_CONFIG_HOME if it's not already set
	if [ ! $XDG_CONFIG_HOME ]; then
		mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
	fi
}

setup_tmux () {
	cp .tmux.conf $HOME
	git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
}

setup_neovim () {
	cp .vimrc $HOME
	mkdir -p $XDG_CONFIG_HOME/nvim/
	cp init.vim $XDG_CONFIG_HOME/nvim/

	pri_dir=$(pwd)
	cd $HOME
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cd $pri_dir

	if [[ ! $(pyenv versions | grep 3.7.3) ]]; then
		pyenv install 3.7.3
	fi
	pyenv virtualenv 3.7.3 neovim3
	pyenv activate neovim3

	pip install jedi
	pip install neovim
	pip install pylint

	nvim --headless +PlugInstall +qa
	nvim --headless +UpdateRemotePlugins +qa

	pyenv deactivate
}

setup_fonts_for_powerline () {
	# set up powerline and its fonts
	git clone --depth 1 https://github.com/powerline/fonts
	cd fonts
	./install.sh
	cd ..
	rm -rf fonts
}

setup_fzf () {
	git clone --depth 1 https://github.com/junegunn/fzf ~/.fzf
	# install fzf and answer yes to all its prompts
	yes | ~/.fzf/install
}


install_packages
construct_shell_config
install_antigen
set_xdg_config_var
install_pyenv
setup_neovim
setup_fonts_for_powerline
setup_fzf
setup_tmux

# Change user's default shell to zsh
chsh -s $(which zsh)
zsh
