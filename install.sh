#!/bin/bash

set -Eeu

NEOVIM_CONFIG=$HOME/.config/nvim
NEOVIM_BACKUP=$NEOVIM_CONFIG.backup

execute() {
		echo "$1"
		eval "$1"
}

log() {
	printf -- '--> %s\n' "$1"
}

err() {
	printf '!!! %s\n' "$1"
}

restore_from_backup() {
	err "Something went wrong. Restoring Neovim config from backup..."
	execute "mv $NEOVIM_BACKUP $NEOVIM_CONFIG"
	log "Successfully restored Neovim from backup. Exiting..."
}

failure() {
	err "Something went wrong! Exiting..."
}

if test -e $NEOVIM_BACKUP; then
    echo "ERROR: Could not create backup of current Neovim config. A backup already exists at \`$NEOVIM_BACKUP\`. Either move it or delete it, then try again."
    exit 1
fi

if test -e $NEOVIM_CONFIG; then
	mv $NEOVIM_CONFIG $NEOVIM_BACKUP
	trap restore_from_backup ERR
	log "Successfully created backup of current Neovim config at $NEOVIM_BACKUP"
else
	trap failure ERR
	log "No preexisting Neovim config found. Continuing without backup..."
fi

log "Installing tree-sitter-cli"
execute "sudo pacman -S --noconfirm tree-sitter-cli"

log "Installing Neovim config"
execute "git clone https://github.com/borgaar/nvim $NEOVIM_CONFIG"

log "DONE! Exiting..."
