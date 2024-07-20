BREW=$(command -v brew)
if [[ ! -z "$BREW" ]]; then

  # Homebrew is present, initialize it
  export HOMEBREW_BUNDLE_FILE="$HOME/.config/brew/Brewfile"
  eval "$(brew shellenv)"

  # direnv
  DIRENV=$HOMEBREW_PREFIX/bin/direnv
  test -f $DIRENV && eval "$($DIRENV hook zsh)"

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

# Environment settings
export EDITOR=nvim

# Completion
autoload -U compinit
compinit

# Don't save commands prepended with a space
setopt histignorespace
export HISTSIZE=10000
export SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS

# Better history search on emacs mode
set -o emacs

# Disable XON/XOFF resume/pause control characters
# (thus allowing ctrl+S to reverse the Ctrl+R)
stty -ixon -ixoff

# More useful history search with ^P/^N
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward

# Aliases
alias c="composer"
alias g="git"
alias la="ls -lhpAG"
alias lg="lazygit"
alias ls="ls -G"
alias lvim="/usr/bin/vim"
alias pa="php artisan"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias nvim="$HOME/bin/nvim-loop"
