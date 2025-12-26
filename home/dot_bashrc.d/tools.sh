#!/usr/bin/env bash
# fzf
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

# Setup starship command prompt for bash
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

# zoxide
if command -v zoxide &> /dev/null
then
    eval "$(zoxide init bash)"
fi
 
# Setup of mise-en-place to enable to find tools in rc file
# See https://mise.jdx.dev/dev-tools/shims.html#zshrc-bashrc-files for more info
if command -v mise &> /dev/null
then
	eval "$(mise activate bash)"
	eval "$(mise hook-env -s bash)"
fi

