BREW=$(command -v brew)
if [[ ! -z "$BREW" ]]; then

  # Homebrew is present, initialize it
  export HOMEBREW_BUNDLE_FILE="$HOME/.config/brew/Brewfile"
  eval "$(brew shellenv)"

  # mise-en-place
  export PATH="$PATH:$HOME/.local/share/mise/shims"

  # PHP Composer
  export PATH="$PATH:$HOME/.composer/vendor/bin"

  # PostgreSQL
  export PATH="$PATH:$HOMEBREW_PREFIX/opt/postgresql@16/bin"

  # z
  Z=$HOMEBREW_PREFIX/etc/profile.d/z.sh
  test -f $Z && . $Z

fi

# Completion
autoload -U compinit
compinit

# Aliases
alias c="composer"
alias g="git"
alias la="ls -lhpAG"
alias lg="lazygit"
alias ls="ls -G"
alias pa="php artisan"
alias v="vim"
alias vi="vim"
