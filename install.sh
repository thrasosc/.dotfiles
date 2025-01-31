#!/bin/zsh

# List of dotfiles to symlink (extend as needed)
DOTFILES=(
  "$HOME/.config/nvim"
  "$HOME/.config/ghostty"
  # Add more files/directories to symlink here
)

DOTFILES_DIR="$HOME/.dotfiles"

# Create backup directory with timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="$HOME/.dotfiles_backup/$TIMESTAMP"

# Function to backup existing file/directory
backup_if_exists() {
    local target="$1"
    local backup_path="$BACKUP_DIR/${target#$HOME/}"
    
    # Only backup if it exists and is not a symlink to our dotfiles
    if [ -e "$target" ] && [ ! -L "$target" -o "$(readlink "$target")" != "$DOTFILES_DIR/${target#$HOME/}" ]; then
        echo "Backing up $target to $backup_path"
        mkdir -p "$(dirname "$backup_path")"
        mv "$target" "$backup_path"
        return 0  # Backup was needed and performed
    fi
    return 1  # No backup needed
}

# Create main directories
mkdir -p "$BACKUP_DIR"

# Counter for backed up files
BACKUP_COUNT=0

for file in "${DOTFILES[@]}"; do
    rel_path="${file#$HOME/}"  # Remove home directory prefix
    source_path="$DOTFILES_DIR/$rel_path"
    
    # Ensure source exists
    if [ ! -e "$source_path" ]; then
        echo "Warning: Source $source_path doesn't exist, skipping..."
        continue
    fi

    # Create necessary parent directories
    mkdir -p "$(dirname "$file")"
    
    # Backup existing file if necessary
    if backup_if_exists "$file"; then
        ((BACKUP_COUNT++))
    fi

    # Create symbolic link
    ln -sf "$source_path" "$file"
done

# Print summary
echo "Dotfiles installation complete!"
if [ $BACKUP_COUNT -gt 0 ]; then
    echo "$BACKUP_COUNT files were backed up to: $BACKUP_DIR"
fi

