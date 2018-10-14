export ZSH="/Users/potibas/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
# ==================

# Editors
export EDITOR='vim'
export GIT_EDITOR='vim'

# Aliases
alias ls="ls -G"
alias la="ls -lpAG"
alias g="git"
alias m="mix"

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
