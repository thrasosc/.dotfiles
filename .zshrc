# Load zsh-autosuggestions first
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Source configuration files
for config_file (~/.zsh/*.zsh) source $config_file

# Load ghcup environment
[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"

# Run fastfetch only in TTY or if explicitly requested
if [[ $- == *i* ]] && [[ -z "$INSIDE_EMACS" ]] && [[ -z "$VSCODE_INJECTION" ]]; then
    # Only run in interactive shell and not in Emacs or VS Code terminal
    fastfetch
fi
