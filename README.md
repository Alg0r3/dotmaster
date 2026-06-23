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

Install or update all managed dotfiles:

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

