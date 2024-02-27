### EXPORT ###
set fish_greeting		# disable fish greeting message
set EDITOR "nvim"

### Manage $PATH
# Add ~/.local/bin to the end of $PATH if the directory exists
fish_add_path --append --path ~/.local/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

### FUNCTIONS ###
function getakscfg -a cluster_name -d "Get kubeconfig file for a specific AKS cluster. You need to be logged in az cli!"
	az aks get-credentials -g rg-aks-$cluster_name-prd -n aks-$cluster_name-prd --admin
end

# Fix bug with flatpak applications that cannot start when keybase is installed and /kbfs is mounted
# https://github.com/flatpak/flatpak/issues/5496
function fix-flatpak -d "Fix flatpak startup issue"
	systemctl --user restart keybase-redirector.service kbfs.service
end

### ALIASES ###
# Changing ls to lsd
alias ls='lsd -al --color=always --group-directories-first'
alias la='lsd -a --color=always --group-directories-first'
alias l.='lsd -a | rg "^\."'

# Better defaults
alias df='df -h'
alias free='free -m'
if type -q rg
	alias grep='rg'
end

# fix-flatpak function
alias fix-flatpaks='fix-flatpak'
alias fix_flatpak='fix-flatpak'
alias fix_flatpaks='fix-flatpak'

# git
alias gst='git status'
alias lg='lazygit'

# kubernetes
alias k='kubectl'
alias kgp='kubectl get pods'

# nvim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

### homebrew for linux
if test -d /home/linuxbrew
	eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

### zoxide
if type -q zoxide
	zoxide init fish | source
end

### starship
if type -q starship
	starship init fish | source
end
