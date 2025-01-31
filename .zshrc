# Load zsh-autosuggestions first
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Run fastfetch at startup
fastfetch

# Source configuration files
for config_file (~/.zsh/*.zsh) source $config_file

# Load Tools & Shell Enhancements
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Load nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Load nvm completion
[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"  # Load ghcup environment
