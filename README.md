# Dotfiles

This repository contains my personal dotfiles configuration for macOS.

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/thrasosc/dotfiles.git ~/.dotfiles
   ```

2. Run the installation script:
   ```bash
   cd ~/.dotfiles
   ./install.sh
   ```

The installation script automatically:

- Creates symbolic links in your home directory that point to the dotfiles
- Backs up existing configurations with timestamps
- Skips already correctly linked files

## Backup System

The installation process includes an automatic backup system that:

- Creates timestamped backups (`~/.dotfiles_backup/[timestamp]`)
- Only backs up files that would be replaced
- Preserves the original directory structure

## Customization

### Adding New Tools

1. Simply add your configuration files to `.dotfiles/` mirroring the structure you want in your home directory
2. Run `install.sh` to create the symlinks

For example:

- `.dotfiles/.config/tool/` → `~/.config/tool/`
- `.dotfiles/.zshrc` → `~/.zshrc`
