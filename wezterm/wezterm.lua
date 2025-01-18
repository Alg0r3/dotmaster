local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.enable_wayland = false
config.window_decorations = "NONE"
config.enable_tab_bar = false
config.window_background_opacity = 0.90
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrainsMono Nerd Font")

return config
