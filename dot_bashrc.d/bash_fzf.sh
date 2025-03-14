#!/usr/bin/env bash
if command -v fzf &> /dev/null
then
# catppuccin frappe
    export FZF_DEFAULT_OPTS=" \
    --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
    --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
    --color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"
# Set up fzf key bindings and fuzzy completion
    eval "$(fzf --bash)"
fi
