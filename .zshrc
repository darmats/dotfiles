#CONF_ZSH_PROMPT=$'%m:%F{cyan}%n%f %F{yellow}%c%f $(git_status)%% '
CONF_ZSH_PROMPT=$'%{$fg[white]%}%n@%m${_RESET_COLOR} %{$fg[green]%}$(shpwd)${_RESET_COLOR} $(git_status)> '

if [ ! -d ~/.zsh ]; then
  mkdir ~/.zsh
fi

if [ -f ~/.zsh/pre.zsh ]; then
  source ~/.zsh/pre.zsh
fi

source ${HOME}/repos/src/github.com/darmats/sh.conf/entrypoint.zsh

if [ -f ~/.zsh/post.zsh ]; then
  source ~/.zsh/post.zsh
fi
