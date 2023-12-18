# homebrew
if [ "$(uname)" = "Linux" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
  eval "$(/usr/local/bin/brew shellenv)"
fi

# rtx
export RTX_LOG_LEVEL=error
if [ -f "$HOME/bin/rtx" ]; then
  eval "$($HOME/bin/rtx activate zsh)"
fi

# postgresql rtx install
export ICU_CFLAGS="-I$(brew --prefix icu4c)/include"
export ICU_LIBS="-L$(brew --prefix icu4c)/lib -licui18n -licuuc -licudata"

# authosuggestions
if [ ! -d "$HOME/.zsh/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U compinit; compinit

# erlang
export KERL_CONFIGURE_OPTIONS="\
  --disable-silent-rules \
  --disable-debug \
  --disable-sctp \
  --enable-gettimeofday-as-os-system-time \
  --enable-dynamic-ssl-lib \
  --enable-darwin-64bit \
  --enable-kernel-poll \
  --enable-shared-zlib \
  --enable-smp-support \
  --enable-threads \
  --enable-hipe \
  --enable-wx \
  --with-ssl=$(brew --prefix openssl@1.1) \
  --with-wx-config=/usr/local/bin/wx-config \
  --without-dynamic-trace \
  --without-jinterface \
  --without-javac \
"

# Enable history in Erlang/IEx
export ERL_AFLAGS="-kernel shell_history enabled"

# aliases
alias g="git"
alias k="kubectl"
alias im="iex -S mix"
alias is="iex -S mix phx.server"
alias ls="exa -lb"
alias la="exa -lba"
alias m="mix"
alias r="bin/rails"
alias rs="bin/rspec"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias cat="bat"
alias d="docker"
alias dps='docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"'
alias comp="docker-compose"
