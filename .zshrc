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

# Vi mode with some readline shortcuts
set -o vi
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^D" delete-char
bindkey "^H" backward-delete-char

# Faster transitions between vi modes (1/100 second)
export KEYTIMEOUT=1

# gpg
export GPG_TTY=$(tty)
