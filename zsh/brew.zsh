if [ -z $(command -v brew) ]; then
  return
fi
if [ -z ${HOMEBREW_PREFIX} ]; then
  HOMEBREW_PREFIX="$(brew --prefix)"
fi

if [ -f ${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source ${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
if [ -d ${HOMEBREW_PREFIX}/share/zsh-completions ]; then

  FPATH=${HOMEBREW_PREFIX}/share/zsh-completions:$FPATH
fi
if [ -f ${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
