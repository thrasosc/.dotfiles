# Load local configuration
[ -f "$HOME/.zsh/.local" ] && source "$HOME/.zsh/.local"

# Load cargo environment
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Ruby gems path
export PATH=/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH
