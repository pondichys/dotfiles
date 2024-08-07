#!/usr/bin/env bash
if command -v fzf &> /dev/null
then
# rose-pine colors for fzf
#	export FZF_DEFAULT_OPTS="
#		--color=fg:#908caa,bg:#191724,hl:#ebbcba
#		--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
#		--color=border:#403d52,header:#31748f,gutter:#191724
#		--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
#		--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

# catppuccin frappe
	export FZF_DEFAULT_OPTS=" \
	--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
	--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
	--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"
# Set up fzf key bindings and fuzzy completion
	eval "$(fzf --bash)"
fi
