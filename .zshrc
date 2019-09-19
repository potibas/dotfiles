export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="awesomepanda"

CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins

if [ ! -d $CUSTOM/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $CUSTOM/zsh-autosuggestions
fi

if [ ! -d $CUSTOM/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $CUSTOM/zsh-syntax-highlighting
fi

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Helper to see if a command exists
command_exists () {
  type "$1" &> /dev/null ;
}

# User configuration
# ==================

# Editors
export EDITOR='vim'
export GIT_EDITOR='vim'

# Aliases
alias ls="ls -G"
alias la="ls -lhpAG"
alias g="git"
alias m="mix"
alias https='http --default-scheme=https'
alias psql='PAGER=cat pgcli -U postgres --less-chatty --auto-vertical-output'
alias pa='php artisan'
alias d='docker'
alias dc='docker-compose'
alias k='kubectl'

# executables
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Python
export PATH="$PATH:$HOME/Library/Python/3.7/bin"
export PATH="$PATH:$HOME/Library/Python/2.7/bin"

# composer
export PATH=$HOME/.composer/vendor/bin:$PATH

# Rust
export PATH=$HOME/.cargo/bin:$PATH

# Go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Ctags
if command_exists brew ; then
  alias ctags="`brew --prefix`/bin/ctags"
fi

# Google cloud paths and completion
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# kubectl autocomplete
if command_exists kubectl; then
  command -v kubectl > /dev/null && source <(kubectl completion zsh)
fi

# HomeBrew autocomplete
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
