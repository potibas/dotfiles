# Home folder executables
export PATH="$HOME/bin:$PATH"

# starship
if type starship > /dev/null 2>/dev/null; then
  eval "$(starship init zsh)"
fi

# z
test -f /usr/local/etc/profile.d/z.sh && source /usr/local/etc/profile.d/z.sh
