# Dotmaster instructions

This repository manages personal dotfiles through GNU Stow.

Be extra conservative. Changes here can affect my shell, terminal, PATH, editor, tmux, and other home-directory configuration.

Do not run these commands unless explicitly asked:

- `make install`
- `make uninstall`
- `stow`
- `stow --delete`
- commands that modify files in `$HOME` outside this repository

Safe commands:

- `make help`
- `make doctor`
- `make dry-run`
- `git status`
- `git diff`

Prefer reviewing `make dry-run` output before applying symlink or file changes.
