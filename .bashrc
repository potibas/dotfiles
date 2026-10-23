# Prevent > from overwriting existing files; use >| to overwrite intentionally.
set -o noclobber

# Omarchy environment (OMARCHY_PATH + PATH), needed even for non-interactive shells
[[ -r /usr/share/omarchy/default/bash/env-bootstrap ]] && source /usr/share/omarchy/default/bash/env-bootstrap

# If not running interactively, don't do anything else (leave this above the rc source)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source "$OMARCHY_PATH/default/bash/rc"

## Keep unlimited history in memory and in ~/.bash_history.
HISTSIZE=-1
HISTFILESIZE=-1
shopt -s histappend

## Saves to history immediately after every command, no overwrites
shopt -s histappend
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

## Aliases
alias d="docker"
alias dust="dust --apparent-size"
alias d1="dust -d 1"
alias gpg="gpg -z0"
alias ls='eza -lbh --group-directories-first --icons=auto'
alias ll="ls -la"
alias v="nvim"
alias vi="nvim"
alias y="yadm"
alias yg='lazygit --git-dir="$HOME/.local/share/yadm/repo.git" --work-tree="$HOME"'
alias ys='yadm enter bash -i'

## Opens Neovim inside yadm
yv() {
  yadm enter nvim "$@"
}

# Temporary aliases until I get used to the new ones
alias pbcopy="wl-copy"
alias pbpaste="wl-paste"
