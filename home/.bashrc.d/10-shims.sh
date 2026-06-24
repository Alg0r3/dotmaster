# Add local shims directory to PATH first

path_prepend_unique() {
    local directory="$1"
    local entry
    local new_path=""

    IFS=':' read -r -a path_entries <<< "$PATH"

    for entry in "${path_entries[@]}"; do
        [[ -n "$entry" ]] || continue
        [[ "$entry" == "$directory" ]] && continue

        if [[ -z "$new_path" ]]; then
            new_path="$entry"
        else
            new_path="$new_path:$entry"
        fi
    done

    export PATH="$directory:$new_path"
}

path_prepend_unique "$HOME/.local/shims"

unset -f path_prepend_unique
