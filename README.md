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
- `zsh/` — zsh config fragments sourced by `.zshrc`; plugins declared
  in `zsh/plugins.txt` and loaded via
  [antidote](https://github.com/mattmc3/antidote) (cloned to
  `~/.antidote` on first shell start)
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

## Neovim shortcuts

Leader is `Space`.

### Fuzzy finding (Telescope)

| Keys | Action |
|---|---|
| `<Space>f` | Find files |
| `<Space>fp` | Live grep across project |
| `<Space>fs` | Document symbols (functions/classes in current file) |
| `;` | Switch buffers |

Inside Telescope: `<C-j>/<C-k>` move, `<CR>` open, `<C-x>/<C-v>/<C-t>`
open in split / vsplit / tab, `<C-q>` send results to quickfix,
`<C-c>` or `<Esc>` close, `<Tab>` multi-select.

### File tree (nvim-tree)

| Keys | Action |
|---|---|
| `<Space>e` | Toggle tree |
| `l` | Open node |
| `h` | Close node / parent |

Plus stock nvim-tree keys (`a` add, `d` delete, `r` rename, `R`
refresh, `?` help inside tree).

### LSP (when a language server is attached)

| Keys | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | References |
| `K` | Hover docs |
| `gl` | Show diagnostic float |
| `[d` / `]d` | Prev / next diagnostic |
| `<Space>q` | Diagnostics → loclist |
| `<C-s>` (insert mode) | Signature help |
| `:Format` | Format buffer (also auto-runs on save via none-ls) |

### Completion (nvim-cmp, in insert mode)

| Keys | Action |
|---|---|
| `<Tab>` / `<S-Tab>` | Next / prev item |
| `<C-j>` / `<C-k>` | Next / prev item |
| `<CR>` | Confirm selection |
| `<C-Space>` | Trigger completion |
| `<C-b>` / `<C-f>` | Scroll docs |
| `<C-e>` | Abort |

### Window / buffer / tmux navigation

| Keys | Action |
|---|---|
| `<C-h/j/k/l>` | Move between vim splits *and* tmux panes |
| `<Tab>` / `<S-Tab>` | Next / prev buffer |
| `<Space><Space>` | Toggle to last file (`<C-^>`) |
| `<Left>/<Right>/<Up>/<Down>` | Resize current split by 1 |

### Visual mode

| Keys | Action |
|---|---|
| `<` / `>` | Indent (keeps selection) |
| `J` / `K` | Move selected lines down / up |
| `<A-j>` / `<A-k>` | Same |

### Misc

- **Autopairs**: `(`, `[`, `{`, `"`, `'` close automatically; `<M-e>`
  triggers fast-wrap around an existing token.
- **Format-on-save**: prettier (JS/TS/web), stylua (Lua), eslint
  diagnostics — via none-ls.
- **Gitsigns**: change indicators in the sign column. No keymaps
  bound; use `:Gitsigns <action>` (e.g. `preview_hunk`, `blame_line`,
  `reset_hunk`).
- **Lazy.nvim**: `:Lazy` opens the plugin manager (`:Lazy sync`,
  `:Lazy clean`, `:Lazy update`).
- **Mason**: `:Mason` for LSP / formatter installs.
