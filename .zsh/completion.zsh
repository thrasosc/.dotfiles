# Completion Settings
autoload -Uz compinit && compinit

# Enable colored and menu-driven completion
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Enable case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Add Shift-Tab support for reverse menu completion
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete
