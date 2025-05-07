if status is-interactive
    # Unbind Ctrl + a to free it for Tmux's prefix
    bind --erase \ca
    bind --erase \cb

    # Bind Ctrl + b to beginning of line
    bind \cb beginning-of-line
end

# Set up fzf key bindings
fzf --fish | source

# Enable zoxyde
zoxide init fish | source

# Load custom Starship transient prompt hook functions
source $XDG_CONFIG_HOME/fish/functions/transient_starship.fish

# Enable Starship prompt
starship init fish | source

# Enable transient prompt behaviour
enable_transience

