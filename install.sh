#!/bin/zsh

# List of dotfiles to symlink (extend as needed)
DOTFILES=(
  "$HOME/.config/nvim"
  # Add more files/directories to symlink here
)

DOTFILES_DIR="$HOME/.dotfiles"

for file in "${DOTFILES[@]}"; do
  rel_path="${file#$HOME/}"  # Remove home directory prefix
  backup_path="$DOTFILES_DIR/$rel_path"

  # Create necessary directories inside ~/.dotfiles (if they don't exist)
  mkdir -p "$(dirname "$backup_path")"

  # Create the symbolic link from the backup to the original location
  # Only create symlink if the file doesn't already exist or isn't already a symlink
  if [ ! -e "$file" ]; then
    ln -s "$backup_path" "$file"
  fi
done

echo "Dotfiles have been symlinked from the repository!"
