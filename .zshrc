# Home folder executables
export PATH="$HOME/bin:$PATH"

# starship
if type starship > /dev/null 2>/dev/null; then
  eval "$(starship init zsh)"
fi

# z
test -f /usr/local/etc/profile.d/z.sh && source /usr/local/etc/profile.d/z.sh

# History search with ^P/^N
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

# Don't save commands prepended with a space to history
setopt histignorespace
