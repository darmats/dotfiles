if [ -z $(command -v direnv) ]; then
  return
fi

eval "$(direnv hook zsh)"

alias dnv='direnv'
alias dnva='direnv allow'
