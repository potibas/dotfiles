# homebrew
eval "$(/usr/local/bin/brew shellenv)"

# rtx
export RTX_LOG_LEVEL=error
if [ -f "$HOME/bin/rtx" ]; then
  eval "$($HOME/bin/rtx activate zsh)"
fi

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
  --with-dynamic-trace=dtrace \
  --without-jinterface \
  --without-javac \
"

# Enable history in Erlang/IEx
export ERL_AFLAGS="-kernel shell_history enabled"

# aliases
alias g="git"
alias im="iex -S mix"
alias is="iex -S mix phx.server"
alias ls="exa"
alias la="exa -lba"
alias m="mix"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias cat="bat"
