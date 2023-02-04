if [ -z $(command -v fzf) ]; then
  return
fi

export FZF_DEFAULT_OPTS="--preview 'head -100 {}' --inline-info"
alias f="fzf"

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
