#!/bin/bash

bashfile=".zshrc"
str="alias vi='nvim'"

install_packages () {
	if [ "$(uname)" = "Linux" ]; then
		yes '' | sudo add-apt-repository ppa:neovim-ppa/stable
		sudo apt-get update
		yes | sudo apt-get install \
						   curl \
						   zsh \
						   ctags \
						   neovim \
						   zsh-antigen \
						   cmake \
						   libfreetype6-dev \
						   libfontconfig1-dev \
						   xclip \
						   python3-pip

	elif [ "$(uname)" = "Darwin" ]; then
		brew install zsh ctags neovim antigen

		#bashfile=".bash_profile"
	fi

	#if ! [ -x "$(command -v rustup)" ]; then
	#    curl https://sh.rustup.rs -sSf | sh
	#fi
	#
	#if ! [ -x "$(command -v alacritty)" ]; then
	#    # install alacritty
	#    cargo install --git https://github.com/jwilm/alacritty
	#fi
}

construct_shell_config () {
	# add lines to shell RC file if it doesn't already contain them
	if [ ! -f ~/$bashfile ]; then
		cp .bashrc ~/$bashfile
	elif grep "$str" ~/$bashfile > /dev/null; then
		echo "FOUND"
	else
		cat .bashrc >> ~/$bashfile
	fi
}

setup_antigen () {
	# zsh package manager
	if [[ ! -f ~/.antigen.zsh ]]; then
		if [ "$(uname)" = "Darwin" ]; then
			cat /usr/local/share/antigen/antigen.zsh > ~/.antigen.zsh
		elif [ "$(uname)" = "Linux" ]; then
			cat /usr/share/zsh-antigen/antigen.zsh > ~/.antigen.zsh
		fi
	fi
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

	pip3 install jedi
	pip3 install neovim
	pip3 install pylint

	nvim --headless +PlugInstall +qa
	nvim --headless +UpdateRemotePlugins +qa
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
setup_antigen
set_xdg_config_var
setup_neovim
setup_fonts_for_powerline
setup_fzf

# Change user's default shell to zsh
chsh -s $(which zsh)
zsh