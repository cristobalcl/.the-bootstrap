# AGENTS

## Repository shape
- This is a machine bootstrap repo (dotfiles + install scripts), not an app/library project.
- Main entrypoint is `bootstrap.sh`; `install.sh` is deprecated and exits immediately.
- Install flow is driven by numbered scripts in `install/` (executed in lexical order by `bootstrap.sh`).

## Commands that matter
- Full bootstrap: `./bootstrap.sh`
- Update an already-bootstrapped machine: `./upgrade.sh`
- Run only one install step while iterating: `./install/30_vim_neovim.sh` (same pattern for other files in `install/`).

## Verified behavior and gotchas
- `bootstrap.sh` runs real system changes (apt/zypper/brew, pip/pipx/snap, git global config, symlinks in `$HOME`); avoid running it in ephemeral/dev containers unless intended.
- Optional features are controlled by env vars read by install scripts:
  - `TB_RECOMMENDED_DRIVERS`
  - `TB_NVIDIA`
  - `TB_DROPBOX`
- `upgrade.sh` assumes `~/.pyenv/versions/neovim2` and `~/.pyenv/versions/neovim3` already exist (created by `install/30_vim_neovim.sh`).

## Where to edit what
- Package lists are source-of-truth in `requirements/*.txt` (apt, brew, pip3, pipx, snap, links, git repos).
- Shared installer helpers live in `lib/`:
  - `lib/system.sh` for OS detection (`OS_NAME`)
  - `lib/requirements.sh` for package installers
  - `lib/files.sh` for `linked`, `linked_p`, `download`, `directory`
- System config in `$HOME` is mostly symlinked from this repo (via `requirements/links.txt` and install scripts), so fix config issues by editing repo files first, not files under `~/.config` directly.
- Neovim config shipped by this repo is under `etc/nvim/` and is linked to `~/.config/nvim` by `install/30_vim_neovim.sh`.

## Neovim-specific note
- Current Neovim config uses `packer.nvim` (`etc/nvim/lua/thebootstrap/plugins/install.lua`), not vim-plug. Use `nvim +PackerSync +qa` for plugin sync; README still mentions `PlugInstall`.
