# Fish Shell Configuration

This directory contains the configuration files for the Fish shell, including functions, key bindings, and plugins managed by [Fisher](https://github.com/jorgebucaran/fisher).

## Fisher Installation

To install [Fisher](https://github.com/jorgebucaran/fisher), run:

```fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```
## Installing Plugins

Once Fisher is installed, run the following command to install all required plugins:

```fish
fisher update
```

This will install all plugins listed in `~/.config/fish/fish_plugins`.

