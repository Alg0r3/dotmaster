if status is-interactive
    # Unbind Ctrl + a to free it for Tmux's prefix
    bind --erase \ca
    bind --erase \cb

    # Bind Ctrl + b to beginning of line
    bind \cb beginning-of-line

    # Set up fzf key bindings
    if command --query fzf
        fzf --fish | source
    end

    # Enable zoxide
    if command --query zoxide
        zoxide init fish | source
    end

    # Enable Starship prompt
    if command --query starship
        # Load custom Starship transient prompt hook functions
        source $XDG_CONFIG_HOME/fish/functions/transient_starship.fish

        starship init fish | source

        # Enable transient prompt behaviour
        if functions --query enable_transience
            enable_transience
        end
    end
end
