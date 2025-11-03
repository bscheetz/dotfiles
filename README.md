# USAGE
Execute the setup.sh file from the dotfiles directory.

# Useful Setup Commands
To set up tmux the first time:
    <prefix> + I

# Windows Setup (for fonts, etc.)
- Go to https://github.com/ryanoasis/nerd-fonts
- download the zip file
- extract the file
- open powershell
- execute the `install.ps1` script to install fonts on Windows

- select one of the Powerline fonts for Windows Terminal
- DONE

# Issues with tmux and zsh
in .tmux.conf change the default shell to /bin/zsh instead of $SHELL


# Windows + Alacritty
- Download the most recent version from https://github.com/jwilm/alacritty/releases
- Ensure that the font is set to "Meslo LG M for Powerline"
- Ensure that "enable_experimental_conpty_backend: true" is set to enable correct colors with NVIM

# Getting Kubernetes in Docker working on Windows
Add the below to C:\Windows\System32\drivers\etc\hosts file\
`127.0.0.1 kubernetes.docker.internal`


# WSL - CrossDistro Mounting (useful for kubernetes volume mounting)
As described https://github.com/docker/for-win/issues/5325
1. Ensure cross distro mounts are set up in /etc/wsl.conf
2. Create a directory in /mnt/wsl
3. Mount the directory you want to be shareable to that folder via `sudo mount --bind {source_dir} /mnt/wsl/{mount_point}`
