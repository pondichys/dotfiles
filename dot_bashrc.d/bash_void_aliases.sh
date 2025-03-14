#!/bin/bash

# Only use these aliases if running arcolinux
if [ -f /etc/os-release ]; then
	os_id=$(awk -F= '/^ID=/{print $2}' /etc/os-release | tr -d '"')
	if [ "$os_id" = "void" ]; then
		# Aliases for software managment
		# xbps
		alias update="sudo xbps-install -Su"
		alias upd="sudo xbps-install -Su"

		# update Void and flatpaks
		alias upall="sudo xbps-install -Su && flatpak update"

		#grub update
		alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
		alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"
		alias install-grub-efi="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Void"

		#backup contents of /etc/skel to hidden backup folder in home/user
		alias bupskel="cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)"

		#Recent Installed Packages
		#alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
		#alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

		#Cleanup orphaned packages
		#alias cleanup="sudo pacman -Rns $(pacman -Qtdq)"

		# This will generate a list of explicitly installed packages
		#alias list="sudo pacman -Qqe"
		#This will generate a list of explicitly installed packages without dependencies
		#alias listt="sudo pacman -Qqet"
		# list of AUR packages
		#alias listaur="sudo pacman -Qqem"
		# add > list at the end to write to a file

		#clear
		#alias clean="clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat"
	
		#search content with ripgrep
		alias rg="rg --sort path"
	
		#give the list of all installed desktops - xsessions desktops
		alias xd="ls /usr/share/xsessions"
		alias xdw="ls /usr/share/wayland-sessions"
	
		#btrfs aliases
		alias btrfsfs="sudo btrfs filesystem df /"
		alias btrfsli="sudo btrfs su li / -t"
	fi
fi
