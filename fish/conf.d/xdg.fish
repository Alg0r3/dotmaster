# Set defaults XDG directories
if not set --query XDG_CONFIG_HOME
    set --universal --export XDG_CONFIG_HOME $HOME/.config
end
if not set --query XDG_CACHE_HOME
    set --universal --export XDG_CACHE_HOME $HOME/.cache
end
if not set --query XDG_DATA_HOME
    set --universal --export XDG_DATA_HOME $HOME/.local/share
end
if not set --query XDG_STATE_HOME
    set --universal --export XDG_STATE_HOME $HOME/.local/state
end

# Set Starship to follow XDG directory specifications
if not set --query STARSHIP_CONFIG
    set --universal --export STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/starship.toml
end

# Set Composer to follow XDG directory specifications
if not set --query COMPOSER_HOME
    set --universal --export COMPOSER_HOME $XDG_CONFIG_HOME/composer
end
if not set --query COMPOSER_CACHE_DIR
    set --universal --export COMPOSER_CACHE_DIR $XDG_CACHE_HOME/composer
end

# Set Docker to follow XDG directory specifications
if not set --query DOCKER_CONFIG
    set --universal --export DOCKER_CONFIG $XDG_CONFIG_HOME/docker
end

