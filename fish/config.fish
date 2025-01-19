if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Set up fzf key bindings
fzf --fish | source

# Enable zoxyde
zoxide init fish | source

# Enable Starship prompt
starship init fish | source

