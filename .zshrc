BREW=$(command -v brew)
if [[ ! -z "$BREW" ]]; then

  # Homebrew is present, initialize it
  export HOMEBREW_BUNDLE_FILE="$HOME/.config/brew/Brewfile"
  eval "$(brew shellenv)"

fi

# Aliases
alias g="git"
alias la="ls -lhpAG"
alias ls="ls -G"
