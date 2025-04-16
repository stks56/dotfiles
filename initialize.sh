#!/bin/bash
# Script to deploy (create symbolic links for) dotfiles to the home directory.
# Existing files will be backed up.

set -e # Exit immediately if a command exits with a non-zero status.

# --- Configuration ---

# Get the directory where the script is located
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# Directory containing the source dotfiles (assumed to be 'dotfiles' alongside the script)
DOTFILES_SOURCE_DIR="$SCRIPT_DIR"

# Target home directory
TARGET_HOME_DIR="$HOME"

# Target .config directory
TARGET_CONFIG_DIR="$HOME/.config"

# Backup directory (timestamped)
BACKUP_DIR="$HOME/backup/dotfiles/$(date +%Y%m%d_%H%M%S)"

# --- Script Body ---

echo "Starting dotfiles deployment..."
echo "  Source: $DOTFILES_SOURCE_DIR"
echo "  Target: $TARGET_HOME_DIR"
echo "  Backup destination: $BACKUP_DIR"
echo ""

# Check if the dotfiles source directory exists
if [ ! -d "$DOTFILES_SOURCE_DIR" ]; then
  echo "Error: Dotfiles directory not found: $DOTFILES_SOURCE_DIR"
  exit 1
fi

# Function to create the backup directory if needed
ensure_backup_dir() {
  if [ ! -d "$BACKUP_DIR" ]; then
    echo "  Creating backup directory: $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR"
  fi
}

# Function to create a symbolic link
# Usage: create_symlink source_path target_path
create_symlink() {
  local source_path="$1"
  local target_path="$2"
  local item_name=$(basename "$source_path")

  echo "Processing: $item_name"

  # If the target path exists (as a file or symlink)
  if [ -e "$target_path" ] || [ -L "$target_path" ]; then
    # If it's already the correct symbolic link
    if [ -L "$target_path" ] && [ "$(readlink "$target_path")" = "$source_path" ]; then
      echo "  Skipping: Correct link already exists ($target_path -> $source_path)"
      return 0
    fi

    # Back up the existing file/directory/link
    ensure_backup_dir
    local backup_path_base="$BACKUP_DIR"
    # If target is inside .config, adjust backup path accordingly
    if [[ "$target_path" == *"$TARGET_CONFIG_DIR"* ]]; then
        backup_path_base="$BACKUP_DIR/.config"
        mkdir -p "$backup_path_base" # Ensure the .config subdir exists in backup
    fi
    echo "  Backing up: Moving $target_path to $backup_path_base/"
    if ! mv "$target_path" "$backup_path_base/"; then
      echo "  Error: Failed to back up $target_path. Skipping."
      return 1 # Use return code instead of continue
    fi
  fi

  # Create the symbolic link (-n is important for links *to* directories)
  echo "  Creating link: $target_path -> $source_path"
  # ln -sfn: -s symbolic, -f force, -n treat link target as a normal file if it is a symlink to a directory
  if ! ln -snf "$source_path" "$target_path"; then
    echo "  Error: Failed to create symlink for $target_path."
    return 1
  fi

  return 0
}

# 1. Process dotfiles/dot-directories in the home directory
echo "Processing files in home directory..."
# Use find to locate dotfiles/dirs, excluding .git, .config, ., ..
find "$DOTFILES_SOURCE_DIR" -maxdepth 1 -name '.*' -not -name '.git' -not -name '.config' -not -name '.' -not -name '..' | while IFS= read -r source_item; do
  target_item="$TARGET_HOME_DIR/$(basename "$source_item")"
  create_symlink "$source_item" "$target_item"
done
echo "Finished processing files in home directory."
echo ""

# 2. Process contents of the .config directory
SOURCE_CONFIG_INTERNAL_DIR="$DOTFILES_SOURCE_DIR/.config"
if [ -d "$SOURCE_CONFIG_INTERNAL_DIR" ]; then
  echo "Processing contents of .config directory..."
  # Ensure the target .config directory exists
  mkdir -p "$TARGET_CONFIG_DIR"

  # Use find to get all items directly inside source .config
  find "$SOURCE_CONFIG_INTERNAL_DIR" -mindepth 1 -maxdepth 1 | while IFS= read -r source_item; do
    target_item="$TARGET_CONFIG_DIR/$(basename "$source_item")"
    create_symlink "$source_item" "$target_item"
  done
  echo "Finished processing contents of .config directory."
else
  echo "Skipping .config directory: Not found in source: $SOURCE_CONFIG_INTERNAL_DIR"
fi
echo ""

echo "Dotfiles deployment complete."
exit 0