# Fix bug with flatpak applications that cannot start when keybase is installed and /kbfs is mounted
# https://github.com/flatpak/flatpak/issues/5496
function fix-flatpak() {
	systemctl --user restart keybase-redirector.service kbfs.service
}
