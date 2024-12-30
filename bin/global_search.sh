#!/bin/bash

# Base directory to search
SEARCH_DIR="$HOME"

# Check if required tools are installed
if ! command -v fd &>/dev/null; then
    echo "Error: 'fd' is required but not installed. Install it and try again." >&2
    exit 1
fi

if ! command -v bat &>/dev/null; then
    echo "Error: 'bat' is required but not installed. Install it and try again." >&2
    exit 1
fi

if ! command -v fzf &>/dev/null; then
    echo "Error: 'fzf' is required but not installed. Install it and try again." >&2
    exit 1
fi

# Run fd to find files and use fzf for fuzzy searching with preview
FILE=$(fd --type f --hidden --exclude ".git" --exclude "node_modules" . "$SEARCH_DIR" | \
    fzf --preview="bat --style=numbers --color=always --line-range=:500 {}" \
        --preview-window=right:60% \
        --height=80% \
        --border \
        --prompt "Search Files: " \
        --header "Use arrows to navigate, Enter to open, and Esc to cancel.")

# Open selected file if any
if [[ -n "$FILE" ]]; then
    #xdg-open "$FILE" &>/dev/null &
    nohup xdg-open "$FILE" >> ~/debug_log.txt 2>&1 &
    sleep 0
fi

