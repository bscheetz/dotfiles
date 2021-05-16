#!/bin/bash
set -e

WORKDIR="/home/user/dotfiles"
shell_config=".zshrc"
antigen_config=".antigenrc"
str="alias vi='nvim'"


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

		sudo apt-get install apt-transport-https --yes
		curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
		# setup for kubectl
		sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
		echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

		# setup for helm
		echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

		sudo apt-get update
		yes | sudo apt-get install \
				ca-certificates \
				curl \
				openssl \
				libreadline-dev \
				sqlite3 \
				curl \
				libffi-dev \
				libbz2-dev \
				libssl-dev \
				libsqlite3-dev \
				zsh \
				ctags \
				neovim \
				zsh-antigen \
				cmake \
				libfreetype6-dev \
				libfontconfig1-dev \
				xclip \
				helm \
				python3-pip \
				python3-venv \
				direnv \
				ripgrep \
				tmux \
				kubectl \
				nodejs \
				npm

	elif [ "$(uname)" = "Darwin" ]; then
		brew install \
			zsh \
			ctags \
			neovim \
			antigen \
			direnv \
			ripgrep \
			helm \
			openssl \
			readline \
			sqlite3 \
			xz \
			zlib \
			kubectl \
			tmux \
			node

	fi

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
	curl -L git.io/antigen > ~/antigen.zsh
	if [ ! -f ~/$antigen_config ]; then
		cp .antigenrc ~/$antigen_config
	fi
}

set_xdg_config_var () {
	# set XDG_CONFIG_HOME if it's not already set
	if [ ! $XDG_CONFIG_HOME ]; then
		mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
	fi
}

install_nvm () {
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
}

install_python_version (){
	if [[ ! $(pyenv versions | grep 3.7.3) ]]; then
		pyenv install 3.7.3
	fi
}

install_pipx () {
	python3 -m pip install --user pipx
	python3 -m pipx ensurepath

	export PATH="$HOME/.local/bin:$PATH"
}

install_poetry () {
	pipx install poetry
}

setup_tmux () {
	cp $WORKDIR/.tmux.conf $HOME
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

	install_python_version
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
	cd $HOME
	git clone --depth 1 https://github.com/powerline/fonts
	cd fonts
	./install.sh
	cd ..
	rm -rf fonts
	cd $WORKDIR
}

setup_fzf () {
	git clone --depth 1 https://github.com/junegunn/fzf ~/.fzf
	# install fzf and answer yes to all its prompts
	yes | ~/.fzf/install
}

setup_kube_for_wsl () {
	if [[ -z "${WSL_DISTRO_NAME}" && ! -f /etc/wsl.conf ]]; then
		sudo sh -c 'echo "[automount]\ncrossDistro = true" > /etc/wsl.conf'
	else
		echo "/etc/wsl.conf exists"
	fi
}

install_vue_cli () {
	mkdir ~/.npm-global
	npm config set prefix '~/.npm-global'
	export PATH=~/.npm-global/bin:$PATH
	npm install -g @vue/cli
}


install_packages
construct_shell_config
install_antigen
set_xdg_config_var
install_pyenv
install_pipx
install_poetry
setup_neovim
setup_fonts_for_powerline
setup_fzf
setup_tmux
setup_kube_for_wsl
install_vue_cli

# Change user's default shell to zsh
sudo chsh -s $(which zsh) user
export SHELL=$(which zsh)
zsh
