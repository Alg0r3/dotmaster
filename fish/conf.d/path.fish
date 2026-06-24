# Add Composer global bin directory to PATH
fish_add_path "$XDG_CONFIG_HOME/composer/vendor/bin"

# Add local shims directory to PATH first
fish_add_path --move --prepend "$HOME/.local/shims"

