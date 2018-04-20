To setup VIM the first time:
    execute ":PlugInstall"

To set up tmux the first time:
    <prefix> + I

# Windows Setup (for fonts, etc.)
Go to https://github.com/powerline/fonts
download the zip file
extract the file
open powershell
execute the `install.ps1` script to install fonts on Windows

select one of the Powerline fonts for minTTY and apply it
DONE

# Issues with tmux and zsh
in .tmux.conf change the default shell to /bin/zsh instead of $SHELL
