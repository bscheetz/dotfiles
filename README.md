# Dotfiles

Personal dotfiles: zsh, neovim, tmux, ansible-driven setup.

## Prerequisites

- zsh
- git, curl
- ansible (bootstrap.sh will install it if missing)
- neovim ≥ 0.11 (uses `vim.lsp.config` / `vim.lsp.enable`)

## Install

```sh
git clone <this-repo> ~/dotfiles
cd ~/dotfiles
./bootstrap.sh
```

`bootstrap.sh` installs ansible (via brew/apt/dnf) and runs the playbook
at `ansible/site.yml`, which symlinks `.zshrc`, `.tmux.conf`, and
`~/.config/nvim` into the repo.

## Layout

- `ansible/` — playbook and roles for setup
- `nvim/` — neovim config (lua, lazy.nvim)
- `zsh/` — zsh config fragments sourced by `.zshrc`
- `.tmux.conf` — tmux config (uses tpm for plugins)
- `bootstrap.sh` — entrypoint; installs ansible and runs the playbook

## First-time tmux setup

Plugins are managed by tpm. On a fresh install:

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then launch tmux and hit `<prefix> + I` to install plugins.

## Windows / WSL notes

- Nerd Fonts: https://github.com/ryanoasis/nerd-fonts — extract and
  run `install.ps1` from an elevated PowerShell, then select a
  Powerline font in Windows Terminal.
- WSL + k8s-in-Docker: add `127.0.0.1 kubernetes.docker.internal` to
  `C:\Windows\System32\drivers\etc\hosts`.
- WSL cross-distro mounts: see
  https://github.com/docker/for-win/issues/5325

## Neovim plugin versions

`nvim/lazy-lock.json` pins plugin versions. Commit it. Update with
`:Lazy sync` and commit the new lock.
