### EXPORT ###
set -e fish_greeting					# Suppresses fish's greeting message
set EDITOR "nvim"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

### FUNCTIONS ###
function getakscfg -a cluster_name -d "Get kubeconfig file for a specific AKS cluster. You need to be logged in az cli!"
	az aks get-credentials -g rg-aks-$cluster_name-prd -n aks-$cluster_name-prd --admin
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

### zoxide
if type -q zoxide
	zoxide init fish | source
end

### starship
if type -q starship
	starship init fish | source
end
