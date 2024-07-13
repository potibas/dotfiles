# Home folder executables
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# starship
if type starship > /dev/null 2>/dev/null; then
  eval "$(starship init zsh)"
fi

# z
test -f /usr/local/etc/profile.d/z.sh && source /usr/local/etc/profile.d/z.sh
test -f /home/linuxbrew/.linuxbrew/etc/profile.d/z.sh && source /home/linuxbrew/.linuxbrew/etc/profile.d/z.sh

# mise
if [ -f "$HOME/.local/bin/mise" ]; then
  eval "$(mise activate zsh)"
fi

# direnv
if [ -f "/usr/local/bin/direnv" ]; then
  eval "$(direnv hook zsh)"
fi

# icu4c tools (PostgreSQL dependency)
export PATH=":$(brew --prefix icu4c)/bin:$PATH"
export PATH=":$(brew --prefix icu4c)/sbin:$PATH"

# HomeBrew PostgreSQL PATH
export PATH=":/usr/local/opt/postgresql@16/bin:$PATH"

# Flags for compiling pgmp extension
export PG_CPPFLAGS="-I/usr/local/opt/gmp/include"
export PG_LDFLAGS="-L/usr/local/opt/gmp/lib"

# PHP composer
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Don't save commands prepended with a space to history
setopt histignorespace

# Raise history size
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Append to history file immediately and save timestamp
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

# Faster transitions between vi modes (1/100 second)
export KEYTIMEOUT=1

# gpg
export GPG_TTY=$(tty)

# Completion
autoload -U compinit
compinit
