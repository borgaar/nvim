#!/bin/bash

set -Eeu

NEOVIM_CONFIG="$HOME/.config/nvim"
NEOVIM_BACKUP="$NEOVIM_CONFIG.backup"

execute() {
	echo "$1"
	$1
}

log() {
	printf -- 'INFO: %s\n' "$1"
}

err() {
	printf 'ERROR: %s\n' "$1"
}

restore_from_backup() {
	err "Something went wrong! Restoring Neovim config from backup..."
	execute "mv $NEOVIM_BACKUP $NEOVIM_CONFIG"
	log "Successfully restored Neovim from backup. Exiting..."
}

failure() {
	err "Something went wrong! Exiting..."
}

if test -e "$NEOVIM_BACKUP"; then
	err "A backup already exists at \`$NEOVIM_BACKUP\`. Move or delete it, then try again."
	exit 1
fi

if test -e "$NEOVIM_CONFIG"; then
	mv "$NEOVIM_CONFIG" "$NEOVIM_BACKUP"
	trap restore_from_backup ERR
	log "Successfully created backup of current Neovim config at $NEOVIM_BACKUP"
else
	trap failure ERR
	log "No preexisting Neovim config found. Continuing without backup..."
fi

arch_install() {
	execute "sudo pacman -S --needed --noconfirm $1"
}

debian_install() {
	execute "sudo apt-get install -y $1"
}

fedora_install() {
	execute "sudo dnf install -y $1"
}

pkgs="git neovim tree-sitter-cli"

log "Installing dependencies: $pkgs"
if command -v pacman >/dev/null 2>&1; then
	arch_install "$pkgs"

elif command -v apt-get >/dev/null 2>&1; then
	sudo apt-get update
	debian_install "$pkgs"

elif command -v dnf >/dev/null 2>&1; then
	fedora_install "$pkgs"

else
	echo "Error: No supported package manager found." >&2
	exit 1
fi

log "Installing Neovim config"
execute "git clone https://github.com/borgaar/nvim $NEOVIM_CONFIG"

log "DONE! Exiting..."
