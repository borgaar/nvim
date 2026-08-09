## Introduction

This Neovim config was written from scratch and is my daily driver for 95% of my
programming work. The main focus of this Neovim config is to stay close to the native
Neovim experience while still providing some nice-to-haves. My personal motivation for
this is to avoid my annoyance of having to essentially relearn Neovim everytime I attempt to use it
on a remote server or some other machine with a default-like Neovim config.

## Compatibility

This config is built on and for Arch-based Linux distributions, but may work on many
other distributions (though no guarantees). I have no clue about this config's MacOS
and Windows support (so assume unsupported).

## Dependencies

The following are the config's dependencies, bar language server binaries and plugins
installed through [lazy.nvim](https://github.com/folke/lazy.nvim):

- [Neovim v0.12.0+](https://neovim.io)
- [Tree-sitter CLI v0.26.1+](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md)
- A C compiler in your PATH.

## Installation

There are multiple ways of installing the config. Method A is recommended.

### Method A (Linux and MacOS only) (recommended)

> [!WARNING]
> This script installs Neovim from your distro's official repository, and as of
> 2026-08-09, Neovim v0.12.0+ is relatively new. Therefore, many distributions, most
> notably Debian and Ubuntu LTS and probably many more, might not have Neovim v0.12.0+
> in order to uphold their security and stability guarantee. In such cases an older
> version of Neovim will be installed and this **will** cause issues unless you manually
> install a more up-to-date version (v0.12.0+) from somewhere else.

The command below executes an install script and should automagically install the Neovim
config and its dependencies, except the language server binaries. It works on Linux
distributions using `pacman`, `apt`, or `dnf` as package managers and (maybe) MacOS with
[Homebrew](https://brew.sh). A backup of your current Neovim config is automatically
created before installation happens.

```bash
curl -L "https://raw.githubusercontent.com/borgaar/nvim/main/install.sh" | /bin/bash
```

## Method B

> [!WARNING]
> Do **not** install Tree-sitter CLI from NPM.

0. Create a backup of your current config if you have one:
    ```bash
    mv "$HOME/.config/nvim" "$HOME/.config/nvim.backup"
    ```
1. Make sure you have Neovim v0.12.0+. If not, [install
   it](https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-package).
1. Install [Tree-sitter CLI v0.26.1+]. It can probably be found in your distribution's
   official repositories. If not, follow [these
   instructions](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md).
1. Install the Neovim config:
    ```bash
    git clone "https://github.com/borgaar/nvim" "$HOME/.config/nvim"
    ```
