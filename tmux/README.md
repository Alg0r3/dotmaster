# Tmux Configuration

This directory contains the configuration files for [Tmux](https://github.com/tmux/tmux).

## Tmux Plugin Manager

This setup uses [Tmux Plugin Manager (TPM)](https://github.com/tmux-plugins/tpm) for plugin management, while the Catppuccin theme is manually cloned and sourced.

Install TPM:

```fish
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Install plugins:

```fish
prefix + I
```

## Catppuccin Installation

Install the Catppuccin theme:

```fish
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
```
