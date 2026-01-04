# Russty's Dotfiles

Clean, simple, and functional dotfiles for developers who prefer simplicity over bells and whistles.

## Features

- **Clean ZSH prompt** with color and contrast
- **Git branch display** in prompt
- **Comprehensive aliases** for git, docker, and development
- **Useful functions** for common tasks
- **Simple installation** script
- **Easy to maintain** and extend

## What's Included

### ZSH Configuration (.zshrc)
- Clean, colorful prompt showing:
  - Username and hostname
  - Current directory
  - Git branch (when in a repo)
- Smart completion with menu selection
- History management
- Key bindings for navigation
- Colorful man pages
- **Tmux auto-start:** Each terminal tab automatically starts in a unique tmux session

### Aliases (.zsh_aliases)
Organized into categories:

**General Utilities:**
- Better defaults: `ll`, `la`, `grep` with colors
- Directory navigation: `..`, `...`, `....`
- Quick edits: `zshrc`, `aliases`, `reload`
- System management: `update`, `install`, `search`

**Git Aliases:**
- Status: `gs`, `gss`, `gl`, `gla`, `gll`
- Branching: `gb`, `gba`, `gco`, `gcob`, `gcom`
- Commits: `ga`, `gaa`, `gc`, `gcm`, `gca`
- Push/Pull: `gp`, `gpf`, `gpl`, `gplr`
- Diff: `gd`, `gdc`, `gds`
- Stash: `gst`, `gstp`, `gstl`
- And many more!

**Docker Aliases:**
- Container management: `dps`, `dpsa`, `dex`, `dlogs`
- Docker Compose: `dc`, `dcup`, `dcdown`, `dclogs`
- Cleanup: `dprune`, `dpruneall`
- Stats: `dstats`, `dinspect`

**Development Aliases:**
- Python: `py`, `venv`, `activate`
- Node: `ni`, `nr`, `ns`, `nt`, `nb`
- Utilities: `serve`, `ports`, `myip`

### Functions (.zsh_functions)
Useful functions for common tasks:

- `mkcd` - Create directory and cd into it
- `extract` - Extract any archive type
- `gcl` - Git clone and cd into directory
- `gacp` - Git add, commit, and push in one command
- `denter` - Enter a Docker container
- `findreplace` - Find and replace in files
- `backup` - Quick backup of a file
- `venvnew` - Create and activate Python venv
- `note` - Quick note-taking
- `weather` - Check weather
- `cheat` - Quick cheat sheets
- And many more!

### Git Configuration (.gitconfig)
- Colorful output
- Useful aliases
- Better defaults
- **Note:** Update the `[user]` section with your name and email

### Vim Configuration (.vimrc)
- Syntax highlighting
- Line numbers
- Smart indentation
- Useful key mappings
- Better defaults

### Global Git Ignore (.gitignore_global)
Ignores common files across all repos:
- OS files (.DS_Store, Thumbs.db)
- Editor files (.vscode, .idea)
- Environment files (.env)
- Dependency directories (node_modules, venv)
- And more!

## Installation

### First Time Setup

1. Clone this repository:
```bash
cd ~/projects
git clone <your-repo-url> dotfiles
cd dotfiles
```

2. Update `.gitconfig` with your information:
```bash
vim .gitconfig
# Update the [user] section with your name and email
```

3. Run the installation script:
```bash
./install.sh
```

4. Restart your terminal or reload:
```bash
source ~/.zshrc
```

### On a New Machine

Simply clone and install:
```bash
git clone <your-repo-url> ~/projects/dotfiles
cd ~/projects/dotfiles
./install.sh
source ~/.zshrc
```

## Customization

### Machine-Specific Settings

The install script creates `~/.zshrc.local` for machine-specific settings that won't be tracked by git. Use this file for:
- Custom PATH additions
- Machine-specific environment variables
- Local aliases or functions

### Adding Your Own Aliases

Edit `~/.zsh_aliases`:
```bash
aliases
# Add your aliases, then save
reload
```

### Adding Your Own Functions

Edit `~/.zsh_functions`:
```bash
vim ~/.zsh_functions
# Add your functions, then save
reload
```

## File Structure

```
dotfiles/
├── .gitconfig           # Git configuration
├── .gitignore_global    # Global git ignore patterns
├── .vimrc               # Vim configuration
├── .zshrc               # Main ZSH configuration
├── .zsh_aliases         # Shell aliases
├── .zsh_functions       # Shell functions
├── install.sh           # Installation script
└── README.md            # This file
```

## Tmux Session Management

Each terminal tab automatically starts in its own tmux session named `term-<pid>`.

### Switching Between Sessions (In-Program)
- **List all sessions:** `Ctrl+b s` (interactive list - use arrows and Enter)
- **Next session:** `Ctrl+b )`
- **Previous session:** `Ctrl+b (`
- **Detach current:** `Ctrl+b d`

### Command-Line Session Management
```bash
tmux list-sessions          # View all sessions
tmux attach -t term-12345   # Attach to specific session
tmux kill-session -t name   # Kill a specific session
```

### Why This Is Useful
- Continue work when switching from physical to remote login
- Never lose terminal state when connection drops
- Switch between different work contexts easily

## Useful Commands

After installation, try these commands:

```bash
# Show all git aliases
alias | grep git

# Show all docker aliases
alias | grep docker

# List all custom functions
typeset -f | grep "^[a-z]"

# Reload configuration
reload

# Edit configuration
zshrc
aliases

# Navigation
projects    # Go to ~/projects
dots        # Go to ~/projects/dotfiles

# Git shortcuts
gs          # git status
gaa         # git add .
gcm "msg"   # git commit -m "msg"
gp          # git push

# Docker shortcuts
dps         # docker ps
dcup        # docker-compose up
dclogs      # docker-compose logs

# Quick server
serve       # Start HTTP server on port 8000
serveon 3000  # Start on specific port

# Notes
note "My note"  # Quick note
notes           # List recent notes

# Weather
weather         # Local weather
weather London  # Weather for specific location

# Cheat sheets
cheat git
cheat docker
cheat python
```

## Backup

Your original configuration files are automatically backed up during installation with a timestamp:
- `~/.zshrc.backup-YYYYMMDD-HHMMSS`
- `~/.gitconfig.backup-YYYYMMDD-HHMMSS`
- etc.

## Uninstallation

To revert to your original configuration:

1. Remove symlinks:
```bash
rm ~/.zshrc ~/.zsh_aliases ~/.zsh_functions ~/.gitconfig ~/.vimrc
```

2. Restore your backups:
```bash
mv ~/.zshrc.backup-YYYYMMDD-HHMMSS ~/.zshrc
# Repeat for other files
```

## Contributing to Your Dotfiles

As you discover new useful aliases or functions, add them to your dotfiles:

```bash
cd ~/projects/dotfiles
# Edit files as needed
git add .
git commit -m "Add new useful alias"
git push
```

## Tips

1. **Explore the aliases** - Run `alias` to see all available shortcuts
2. **Use tab completion** - Most commands have smart completion
3. **Customize colors** - Edit the prompt in `.zshrc` to change colors
4. **Add your own** - Create custom aliases and functions for your workflow
5. **Keep it simple** - Only add what you actually use

## Philosophy

These dotfiles follow a simple philosophy:
- **Simplicity over complexity** - No fancy frameworks, just clean configs
- **Readability** - Well-organized and commented
- **Functionality** - Includes only what's useful for daily development
- **Maintainability** - Easy to understand and modify

## License

Feel free to use, modify, and share these dotfiles as you see fit.
