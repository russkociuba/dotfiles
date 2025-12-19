# ============================================================================
# Russty's Clean ZSH Configuration
# ============================================================================

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt APPEND_HISTORY

# Directory navigation
setopt AUTO_CD              # Type directory name to cd
setopt AUTO_PUSHD           # Make cd push old directory onto stack
setopt PUSHD_IGNORE_DUPS    # Don't push duplicates
setopt PUSHD_SILENT         # Don't print directory stack

# Completion system
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Case insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"     # Color completions

# ============================================================================
# Clean, Colorful Prompt
# ============================================================================

# Enable colors
autoload -U colors && colors

# Git branch function
git_branch() {
    local branch
    if branch=$(git symbolic-ref --short HEAD 2>/dev/null); then
        echo " %{$fg[magenta]%}($branch)%{$reset_color%}"
    fi
}

# Set the prompt
setopt PROMPT_SUBST
PROMPT='%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%} %{$fg[yellow]%}%~%{$reset_color%}$(git_branch)
%{$fg[blue]%}$%{$reset_color%} '

# Right prompt with time (optional, comment out if you don't want it)
# RPROMPT='%{$fg[gray]%}%*%{$reset_color%}'

# ============================================================================
# Key bindings
# ============================================================================

# Emacs-style key bindings (change to 'bindkey -v' for vi mode)
bindkey -e

# Ctrl+arrow keys for word navigation
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Home and End keys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Delete key
bindkey "^[[3~" delete-char

# ============================================================================
# Load aliases and functions
# ============================================================================

# Source aliases if file exists
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases

# Source functions if file exists
[[ -f ~/.zsh_functions ]] && source ~/.zsh_functions

# Source local overrides (not in dotfiles repo)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# ============================================================================
# Environment Variables
# ============================================================================

# Preferred editor
export EDITOR='vim'
export VISUAL='vim'

# Colorful man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Enable color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
