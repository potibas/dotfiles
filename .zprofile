# homebrew
eval "$(/usr/local/bin/brew shellenv)"

# rtx
export RTX_LOG_LEVEL=error
if [ -f "$HOME/bin/rtx" ]; then
  eval "$($HOME/bin/rtx activate zsh)"
fi

# aliases
alias g="git"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
