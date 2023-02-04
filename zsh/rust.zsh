if [ -z $(command -v rustup-init) ]; then
  return
fi

if [ ! -d "${HOME}/.cargo/bin" ]; then
  rustup-init
fi

export PATH="${HOME}/.cargo/bin:$PATH"
. "$HOME/.cargo/env"
