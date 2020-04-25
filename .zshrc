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

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
# ==================
source $HOME/bin/shell/paths.sh
source $HOME/bin/shell/aliases.sh

# HomeBrew autocomplete
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Enable history in IEx
export ERL_AFLAGS="-kernel shell_history enabled"
