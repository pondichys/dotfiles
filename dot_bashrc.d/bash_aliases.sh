alias cat='bat'

alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# Kubernetes stuff
alias k='kubectl'
alias kc='kubectx'
alias kns='kubens'

# File stuff
alias ls='lsd --group-directories-first'
alias ll='lsd --all --group-directories-first --git --long'
alias tree='lsd --all --directory-only --tree'

# Colorize grep output
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Ease reading of sizes
alias df='df -h'
alias free='free -m'

# Git stuff
alias gst='git status'
alias ga='git add'
alias gapa='git add --patch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gp='git push'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glo='git log --pretty="oneline"'
alias lg='lazygit'

# Top 5 processes consuming memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# Top 5 processes consuming CPU
alias pscpu='ps auxf | sort -nr -k 3 | head 5'

# Fix flatpaks not starting when /kbfs is mounted
alias fix-flatpaks='fix-flatpak'
alias fix_flatpak='fix-flatpak'
alias fix_flatpaks='fix-flatpak'
