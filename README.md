# dotmaster

A curated collection of my personal configuration files, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites

Install GNU Stow and GNU Make.

### Debian/Ubuntu

```bash
sudo apt install stow make
```

### Fedora

```bash
sudo dnf install stow make
```

## Setup

Clone this repository:

```bash
git clone https://github.com/Alg0r3/dotmaster.git
cd dotmaster
```

Check the local environment:

```bash
make doctor
```

Preview the Stow symlink changes:

```bash
make dry-run
```

If the preview reports a missing target directory, create that directory first or review the directory list from `make doctor`.

Install or update all managed dotfiles after reviewing the preview:

```bash
make install
```

## Commands

Show available commands:

```bash
make help
```

Check required tools and the dotfiles environment:

```bash
make doctor
```

Preview Stow symlink changes without applying them:

```bash
make dry-run
```

This command is read-only and expects target directories to already exist.

## Structure

This repository uses GNU Stow packages grouped by target directory.

### `~/.config` packages

These packages are installed into `~/.config`:
- fish
- starship
- tmux
- wezterm

For example:

```text
dotmaster/fish -> ~/.config/fish
```

### `$HOME` packages

These packages are installed into `$HOME`:
- home

For example:

```text
dotmaster/home/.local/shims -> ~/.local/shims
```

The `home` package is used for files that do not belong under `~/.config`.
