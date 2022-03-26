export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="awesomepanda"

# Install custom plugins
# ======================
CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins

if [ ! -d $CUSTOM/zsh-autosuggestions ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $CUSTOM/zsh-autosuggestions
fi

if [ ! -d $CUSTOM/zsh-syntax-highlighting ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $CUSTOM/zsh-syntax-highlighting
fi

if [ ! -d $CUSTOM/zsh-z ]; then
  git clone https://github.com/agkozak/zsh-z.git $CUSTOM/zsh-z
fi

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-z
)

source $ZSH/oh-my-zsh.sh

# User configuration
# ==================
source $HOME/bin/shell/paths.sh
source $HOME/bin/shell/aliases.sh
[ -f "$HOME/bin/shell/local.sh" ] && . "$HOME/bin/shell/local.sh"

# Vi editing mode
bindkey -v

# History search with ^P/^N
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

# Don't save commands prepended with a space to history
setopt histignorespace

# Homebrew
if [ -s "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  # Autocomplete
  FPATH=/opt/homebrew/share/zsh/site-functions:$FPATH
fi

# Enable history in IEx
export ERL_AFLAGS="-kernel shell_history enabled"

# Enable asdf
if [ -d $HOME/.asdf ]; then
  . $HOME/.asdf/asdf.sh
  export KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=/opt/homebrew/opt/openssl@1.1"
fi

# nfm
[ -s "/opt/homebrew/bin/fnm" ] && eval "$(/opt/homebrew/bin/fnm env)"

# Rust
[ -s "$HOME/.asdf/installs/rust/1.54.0" ] && source "$HOME/.asdf/installs/rust/1.54.0/env"

# FZF
export FZF_DEFAULT_COMMAND="rg --files --follow --no-ignore-vcs --hidden -g '!{**/node_modules/*,**/.git/*,**/_build/*,**/deps/*,**/.elixir_ls/*}'"
export FZF_DEFAULT_OPTS="--history=$HOME/.fzf_history"

# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Faster faster!
ulimit -n 3000
