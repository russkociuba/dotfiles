#!/bin/bash

# ============================================================================
# Dotfiles Installation Script
# ============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where this script is located
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}  Dotfiles Installation${NC}"
echo -e "${BLUE}================================${NC}"
echo ""

# Function to backup existing files
backup_file() {
    local file=$1
    if [ -f "$file" ] || [ -L "$file" ]; then
        local backup="${file}.backup-$(date +%Y%m%d-%H%M%S)"
        echo -e "${YELLOW}Backing up existing $file to $backup${NC}"
        mv "$file" "$backup"
    fi
}

# Function to create symlink
create_symlink() {
    local source=$1
    local target=$2

    if [ -f "$target" ] || [ -L "$target" ]; then
        backup_file "$target"
    fi

    echo -e "${GREEN}Creating symlink: $target -> $source${NC}"
    ln -sf "$source" "$target"
}

# Install ZSH configuration
echo -e "${BLUE}Installing ZSH configuration...${NC}"
create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/.zsh_aliases" "$HOME/.zsh_aliases"
create_symlink "$DOTFILES_DIR/.zsh_functions" "$HOME/.zsh_functions"

# Install Git configuration if it exists
if [ -f "$DOTFILES_DIR/.gitconfig" ]; then
    echo -e "${BLUE}Installing Git configuration...${NC}"
    create_symlink "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
fi

# Install Vim configuration if it exists
if [ -f "$DOTFILES_DIR/.vimrc" ]; then
    echo -e "${BLUE}Installing Vim configuration...${NC}"
    create_symlink "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
fi

# Create .zshrc.local if it doesn't exist
if [ ! -f "$HOME/.zshrc.local" ]; then
    echo -e "${BLUE}Creating .zshrc.local for machine-specific settings...${NC}"
    cat > "$HOME/.zshrc.local" << 'EOF'
# Machine-specific ZSH configuration
# This file is not tracked by git - add your local overrides here

# Example: Custom PATH additions
# export PATH="$HOME/custom/bin:$PATH"

# Example: Machine-specific environment variables
# export MY_LOCAL_VAR="value"
EOF
fi

echo ""
echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}  Installation Complete!${NC}"
echo -e "${GREEN}================================${NC}"
echo ""
echo -e "Your old configuration files have been backed up."
echo -e "To apply the changes, either:"
echo -e "  1. Restart your terminal"
echo -e "  2. Run: ${YELLOW}source ~/.zshrc${NC}"
echo ""
