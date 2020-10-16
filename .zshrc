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

# Vi editing mode
bindkey -v

# History search with ^P/^N
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

# HomeBrew autocomplete
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Enable history in IEx
export ERL_AFLAGS="-kernel shell_history enabled"
