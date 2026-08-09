# Introduction

This Neovim config was written from scratch and is my daily driver for 95% of my
programming work. The main focus of this Neovim config is to stay close to the native
Neovim experience while still providing some nice-to-haves. My personal motivation for
this is to avoid my annoyance of having to essentially relearn Neovim everytime I attempt to use it
on a remote server or some other machine with a default-like Neovim config.

# Compatibility

This config is built on and for Arch-based Linux distributions, but may work on many
other distributions (though no guarantees). I have no clue about this config's MacOS
and Windows support (so assume unsupported).

# Dependencies

The following are the config's dependencies, bar language server binaries and plugins
installed through [lazy.nvim](https://github.com/folke/lazy.nvim):

- [Neovim v0.12.x](https://neovim.io)
- [`tree-sitter-cli`](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md)

# Installation (Linux and MacOS only)

The command below should automagically install the Neovim config and its dependencies,
except the language server binaries. It (probably) works on MacOS with
[Homebrew](https://brew.sh) and Linux distributions using `pacman`, `apt` or `dnf`
as package managers.

```bash
curl -L "https://raw.githubusercontent.com/borgaar/nvim/main/install.sh" | /bin/bash
```
