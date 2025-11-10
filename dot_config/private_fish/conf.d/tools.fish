#!/usr/bin/env fish
# 
### homebrew for linux
if test -d /home/linuxbrew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

### Activate mise with shims
if type -q mise
    mise activate fish --shims | source
end

if status is-interactive

    ### FUNCTIONS ###
    # Fix bug with flatpak applications that cannot start when keybase is installed and /kbfs is mounted
    # https://github.com/flatpak/flatpak/issues/5496
    function fix-flatpak -d "Fix flatpak startup issue"
        systemctl --user restart keybase-redirector.service kbfs.service
    end

    ### Activate mise
    if type -q mise
        mise activate fish | source
	# This line is required to get access to tools installed with mise inside the fish config files
	# See https://mise.jdx.dev/dev-tools/shims.html#using-mise-in-rc-files
        mise hook-env -s fish | source
    end

    ### zoxide
    if type -q zoxide
        zoxide init fish | source
        alias za="zoxide add $PWD"
    end

    ### fastfetch
    if type -q fastfetch
        alias ff='fastfetch'
    end

    ### fzf
    if type -q fzf
        fzf --fish | source
    end

    ### lazygit
    if type -q lazygit
        alias lg='lazygit'
    end

    ### starship
    if type -q starship
        starship init fish | source
    end
end
