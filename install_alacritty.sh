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
