#!/usr/bin/env fish
# 
### homebrew for linux
if test -d /home/linuxbrew
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
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
        mise activate fish --shims | source
    end

    ### zoxide
    if type -q zoxide
        zoxide init fish | source
        alias za="zoxide add $PWD"
    end

    ### fastfetch
    if type -q fastfetch
        alias ff='fastfetch'
        fastfetch
    end

    ### fzf
    if type -q fzf
        fzf --fish | source
    end

    ### starship
    if type -q starship
        starship init fish | source
    end
end
