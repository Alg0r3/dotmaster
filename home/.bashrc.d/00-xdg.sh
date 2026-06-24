# Set defaults for XDG Base Directories if not already set
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# Set Starship to follow XDG directory specifications
export STARSHIP_CONFIG="${STARSHIP_CONFIG:-$XDG_CONFIG_HOME/starship/starship.toml}"

# Set Composer to follow XDG directory specifications
export COMPOSER_HOME="${COMPOSER_HOME:-$XDG_CONFIG_HOME/composer}"
export COMPOSER_CACHE_DIR="${COMPOSER_CACHE_DIR:-$XDG_CACHE_HOME/composer}"

# Set Docker to follow XDG directory specifications
export DOCKER_CONFIG="${DOCKER_CONFIG:-$XDG_CONFIG_HOME/docker}"

