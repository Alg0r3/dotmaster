# Tmux Configuration

This directory contains the configuration files for [Tmux](https://github.com/tmux/tmux) with the [Catppuccin theme](https://github.com/catppuccin/tmux).

## Catppuccin installation for Tmux

Since this setup does not use the [Tmux Plugin Manager (TPM)](https://github.com/tmux-plugins/tpm), the Catppuccin theme is manually cloned and sourced.

```fish
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
```

