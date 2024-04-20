#!/bin/bash

# Only use these aliases if running arcolinux
if [ -f /etc/os-release ]; then
	os_id=$(awk -F= '/^ID=/{print $2}' /etc/os-release | tr -d '"')
	if [ "$os_id" = "arcolinux" ]; then
		# show the list of packages that need this package - depends mpv as example
		function_depends()  {
			search=$(echo "$1")
			sudo pacman -Sii $search | grep "Required" | sed -e "s/Required By     : //g" | sed -e "s/  /\n/g"
		}

		alias depends="function_depends"

		#pacman unlock
		alias unlock="sudo rm /var/lib/pacman/db.lck"
		alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

		# Aliases for software managment
		# pacman
		alias update="sudo pacman -Syyu"
		alias upd="sudo pacman -Syyu"

		#grub update
		alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
		alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"
		#grub issue 08/2022
		alias install-grub-efi="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ArcoLinux"

		#backup contents of /etc/skel to hidden backup folder in home/user
		alias bupskel="cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)"

		#get fastest mirrors in your neighborhood
		alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
		alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
		alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
		alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
		#our experimental - best option for the moment
		alias mirrorx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
		alias mirrorxx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
		alias ram="rate-mirrors --allow-root --disable-comments arch | sudo tee /etc/pacman.d/mirrorlist"
		alias rams="rate-mirrors --allow-root --disable-comments --protocol https arch  | sudo tee /etc/pacman.d/mirrorlist"
	
		#Recent Installed Packages
		alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
		alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

		#iso and version used to install ArcoLinux
		alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"	
		alias isoo="cat /etc/dev-rel"
	
		#Cleanup orphaned packages
		alias cleanup="sudo pacman -Rns $(pacman -Qtdq)"

		# This will generate a list of explicitly installed packages
		alias list="sudo pacman -Qqe"
		#This will generate a list of explicitly installed packages without dependencies
		alias listt="sudo pacman -Qqet"
		# list of AUR packages
		alias listaur="sudo pacman -Qqem"
		# add > list at the end to write to a file

		#clear
		alias clean="clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat"
	
		#search content with ripgrep
		alias rg="rg --sort path"
	
		#get the error messages from journalctl
		alias jctl="journalctl -p 3 -xb"
	
		#fixes
		alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"
		alias keyfix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
		alias key-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
		alias keys-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
		alias fixkey="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
		alias fixkeys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
		alias fix-key="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
		alias fix-keys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
		alias fix-pacman-conf="/usr/local/bin/arcolinux-fix-pacman-conf"
		alias fix-pacman-keyserver="/usr/local/bin/arcolinux-fix-pacman-gpg-conf"
		alias fix-grub="sudo /usr/local/bin/arcolinux-fix-grub"
		alias fixgrub="sudo /usr/local/bin/arcolinux-fix-grub"
	
		#maintenance
		alias big="expac -H M '%m\t%n' | sort -h | nl"

		#give the list of all installed desktops - xsessions desktops
		alias xd="ls /usr/share/xsessions"
		alias xdw="ls /usr/share/wayland-sessions"
	
		#give a list of the kernels installed
		alias kernel="ls /usr/lib/modules"
		alias kernels="ls /usr/lib/modules"
	
		#am I on grub,systemd-boot or refind
		alias boot="sudo /usr/local/bin/arcolinux-boot"
	
		#btrfs aliases
		alias btrfsfs="sudo btrfs filesystem df /"
		alias btrfsli="sudo btrfs su li / -t"
		alias downgrada="sudo downgrade --ala-url https://ant.seedhost.eu/arcolinux/"
	
		#arcolinux applications
		alias adt="arcolinux-desktop-trasher"
		alias abl="arcolinux-betterlockscreen"
		alias agm="arcolinux-get-mirrors"
		alias amr="arcolinux-mirrorlist-rank-info"
		alias aom="arcolinux-osbeck-as-mirror"
		alias ars="arcolinux-reflector-simple"
		alias atm="arcolinux-tellme"
		alias avs="arcolinux-vbox-share"
		alias awa="arcolinux-welcome-app"
	fi
fi
