export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="awesomepanda"

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
alias https='http --default-scheme=https'
alias psql='PAGER=cat pgcli -U postgres --less-chatty --auto-vertical-output'
alias pa='php artisan'

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# executables
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Python
export PATH="$PATH:$HOME/Library/Python/3.7/bin"

# composer
export PATH=$HOME/.composer/vendor/bin:$PATH

