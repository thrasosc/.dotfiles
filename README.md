# Dotfiles

This repository contains my personal dotfiles configuration, managed using [GNU Stow](https://www.gnu.org/software/stow/).

## Setup

```bash
# Install GNU Stow
Linux: pacman -S stow     # or your package manager
macOS: brew install stow

# Clone and enter repository
git clone https://github.com/thrasosc/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

## Structure

Each tool's configuration is organized in its own directory, mirroring the structure from the home directory:

```
~/.dotfiles/
├── ghostty/
│   └── .config/
│       └── ghostty/
└── nvim/
    └── .config/
        └── nvim/
```

## Usage

### Basic Stow Commands

- Link a configuration:

  ```bash
  stow <package>      # e.g., stow ghostty
  ```

- Unlink a configuration:

  ```bash
  stow -D <package>   # e.g., stow -D ghostty
  ```

- Relink a configuration (useful after updates):
  ```bash
  stow -R <package>   # e.g., stow -R ghostty
  ```

### Adding New Configurations

1. Create a new directory for your tool
2. Mirror the exact structure from your home directory
3. Move your configuration files into place
4. Use stow to create the symlinks

For example, to add tmux configuration:

```bash
mkdir -p tmux/.config/tmux
mv ~/.config/tmux/tmux.conf tmux/.config/tmux/
stow tmux
```
