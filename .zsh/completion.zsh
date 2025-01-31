# Load completion system
autoload -Uz compinit

# Only check completion dump once a day
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Enable colored and menu-driven completion
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Enable case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Add Shift-Tab support for reverse menu completion
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete
