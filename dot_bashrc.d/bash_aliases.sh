#!/usr/bin/env bash

alias cat='bat'

alias v='nvim'
alias vi='nvim'

# Kubernetes stuff
# alias k='kubectl'
# alias kc='kubectx'
# alias kns='kubens'

# File stuff
if command -v lsd &> /dev/null
then
	alias ls='lsd --group-directories-first'
	alias ll='lsd --all --group-directories-first --git --long'
	alias tree='lsd --all --directory-only --tree'
fi

if command -v eza &> /dev/null
then
	alias ls='eza --group-directories-first'
	alias ll='eza --all --group-directories-first --git --long'
	alias tree='eza --all --directory-only --tree'
fi

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
if command -v lazygit &> /dev/null
then
	alias lg='lazygit'
fi

# Top 5 processes consuming memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# Top 5 processes consuming CPU
alias pscpu='ps auxf | sort -nr -k 3 | head 5'

# Fix flatpaks not starting when /kbfs is mounted
alias fix-flatpaks='fix-flatpak'
alias fix_flatpak='fix-flatpak'
alias fix_flatpaks='fix-flatpak'

# Update GRUB
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'

# PACMAN
# show the list of packages that need this package - depends mpv as example
function_depends()  {
	search=$(echo "$1")
	sudo pacman -Sii $search | grep "Required" | sed -e "s/Required By     : //g" | sed -e "s/  /\n/g"
}

alias depends="function_depends"

# pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

# Aliases for software managment
# pacman
alias update="sudo pacman -Syyu"
alias upd="sudo pacman -Syyu"

# Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

# Cleanup orphaned packages
alias cleanup="sudo pacman -Rns $(pacman -Qtdq)"

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Various fixes
function_fixkeys() {
	sudo rm /var/lib/pacman/sync/* && \
	sudo rm -rf /etc/pacman.d/gnupg/* && \
	sudo pacman-key --init && \
	sudo pacman-key --populate && \	
	sudo pacman -Sy --noconfirm archlinux-keyring && \
	sudo pacman --noconfirm -Su
}

alias keyfix="function_fixkeys"
alias key-fix="function_fixkeys"
alias keys-fix="function_fixkeys"
alias fixkey="function_fixkeys"
alias fixkeys="function_fixkeys"
alias fix-key="function_fixkeys"
alias fix-keys="function_fixkeys"
