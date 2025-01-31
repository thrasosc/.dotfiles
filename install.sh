#!/bin/zsh

# List of dotfiles to symlink (extend as needed)
DOTFILES=(
  "$HOME/.config/nvim"
  "$HOME/.config/ghostty"
  "$HOME/.config/yazi"
  "$HOME/.zshrc"
  "$HOME/.zshenv"
  "$HOME/.zprofile"
  "$HOME/.zsh"
)

DOTFILES_DIR="$HOME/.dotfiles"

# Create backup directory with timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="$HOME/.dotfiles_backup/$TIMESTAMP"

# Function to check if symlink points to our dotfiles
is_correct_symlink() {
    local target="$1"
    local expected_source="$2"
    
    if [ -L "$target" ]; then
        local link_dest="$(readlink "$target")"
        if [ "$link_dest" = "$expected_source" ]; then
            return 0  # Correct symlink
        fi
    fi
    return 1  # Not a symlink or wrong destination
}

# Function to backup existing file/directory
backup_if_needed() {
    local target="$1"
    local source="$2"
    local backup_path="$BACKUP_DIR/${target#$HOME/}"
    
    # If it's already correctly symlinked, do nothing
    if is_correct_symlink "$target" "$source"; then
        echo "Correct symlink already exists: $target -> $source"
        return 1  # No backup needed
    fi
    
    # If it exists (as a file, directory, or wrong symlink), back it up
    if [ -e "$target" -o -L "$target" ]; then
        echo "Backing up $target to $backup_path"
        mkdir -p "$(dirname "$backup_path")"
        mv "$target" "$backup_path"
        return 0  # Backup was performed
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
    if backup_if_needed "$file" "$source_path"; then
        ((BACKUP_COUNT++))
    fi

    # Create symbolic link if it doesn't exist or points to wrong location
    if ! is_correct_symlink "$file" "$source_path"; then
        ln -sf "$source_path" "$file"
        echo "Created symlink: $file -> $source_path"
    fi
done

# Print summary
echo "Dotfiles installation complete!"
if [ $BACKUP_COUNT -gt 0 ]; then
    echo "$BACKUP_COUNT files were backed up to: $BACKUP_DIR"
fi

