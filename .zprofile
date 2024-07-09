# homebrew
if [ "$(uname)" = "Linux" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
  eval "$(/usr/local/bin/brew shellenv)"
fi

# postgres
export ICU_CFLAGS="-I$(brew --prefix icu4c)/include"
export ICU_LIBS="-L$(brew --prefix icu4c)/lib -licui18n -licuuc -licudata"
export POSTGRES_EXTRA_CONFIGURE_OPTIONS="--with-libxml"

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
  --with-wx-config=/usr/local/bin/wx-config \
  --with-ssl=$(brew --prefix openssl) \
  --without-dynamic-trace \
  --without-jinterface \
  --without-javac \
"

# Enable history in Erlang/IEx
export ERL_AFLAGS="-kernel shell_history enabled"

# Edit with neovim
export EDITOR="nvim"

# basic aliases
alias b="brew"
alias c="composer"
alias d="docker"
alias g="git"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# modern unix tools
alias ls="eza -lb"
alias la="eza -lba"

# docker shortcuts
alias comp="docker compose"
alias docker-compose="docker compose"
alias dps='docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"'

# dev aliases
alias im="iex -S mix"
alias is="iex -S mix phx.server"
alias m="mix"
alias pa="php artisan"
alias r="bin/rails"
alias rs="bin/rspec"
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'

# misc
alias plb=/usr/libexec/PListBuddy
