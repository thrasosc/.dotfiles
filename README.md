# Dotfiles

This repository contains my personal [dotfiles](https://wiki.archlinux.org/title/Dotfiles) configuration, managed using [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

Each directory represents a "package" that can be independently managed:

- `vim/` - Vim configuration (.vimrc)
- `nvim/` - Neovim configuration 
- `ghostty/` - Ghostty terminal configuration

## Setup

```bash
git clone https://github.com/thrasosc/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Install all packages
stow vim nvim ghostty

# Or install individual packages
stow vim
stow nvim
stow ghostty
```

## Managing Packages

```bash
# Add a new package
stow package_name

# Remove a package  
stow -D package_name

# Restow (useful after adding new files)
stow -R package_name
```

> **Note:** When adding new packages, update `.gitignore` to include the new package directory and its contents.
