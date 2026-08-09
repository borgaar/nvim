#!/bin/bash

set -Eeu

NEOVIM_CONFIG="$HOME/.config/nvim"
NEOVIM_BACKUP="$NEOVIM_CONFIG.backup"
BACKUP_EXISTS=false

execute() {
	echo "$*"
	"$@"
}

log() {
	printf 'INFO: %s\n' "$1"
}

err() {
	printf 'ERROR: %s\n' "$1" >&2
}

restore_from_backup() {
	trap - ERR
	err "Something went wrong! Restoring Neovim config from backup..."
	execute rm -rf "$NEOVIM_CONFIG"
	execute mv "$NEOVIM_BACKUP" "$NEOVIM_CONFIG"
	log "Successfully restored Neovim from backup. Exiting..."
}

failure() {
	trap - ERR
	err "Something went wrong! Exiting..."
}

if test -e "$NEOVIM_BACKUP"; then
	err "A backup already exists at \`$NEOVIM_BACKUP\`. Move or delete it, then try again."
	exit 1
fi

if test -e "$NEOVIM_CONFIG"; then
	execute mv "$NEOVIM_CONFIG" "$NEOVIM_BACKUP"
	BACKUP_EXISTS=true
	trap restore_from_backup ERR
	log "Successfully created backup of current Neovim config at $NEOVIM_BACKUP"
else
	trap failure ERR
	log "No preexisting Neovim config found. Continuing without backup..."
fi

arch_install() {
	execute sudo pacman -S --needed --noconfirm "$@"
}

debian_install() {
	execute sudo apt-get update
	execute sudo apt-get install -y "$@"
}

fedora_install() {
	execute sudo dnf install -y "$@"
}

mac_install() {
	execute brew install "$@" --yes
}

pkgs=(git neovim tree-sitter-cli)

log "Installing dependencies: ${pkgs[*]}"

if command -v pacman >/dev/null 2>&1; then
	arch_install "${pkgs[@]}"
elif command -v apt-get >/dev/null 2>&1; then
	debian_install "${pkgs[@]}"
elif command -v dnf >/dev/null 2>&1; then
	fedora_install "${pkgs[@]}"
elif command -b brew >/dev/null 2>&1; then
	mac_install "${pkgs[@]}"
else
	err "No supported package manager found."
	exit 1
fi

log "Installing Neovim config"
execute git clone https://github.com/borgaar/nvim "$NEOVIM_CONFIG"

if $BACKUP_EXISTS; then
	log "DONE! Backup of previous config is at $NEOVIM_BACKUP"
	log "Exiting..."
else
	log "DONE! Exiting..."
fi
