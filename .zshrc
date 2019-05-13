#CONF_ZSH_PROMPT=$'%m:%F{cyan}%n%f %F{yellow}%c%f $(git_super_status)%% '
CONF_ZSH_PROMPT=$'%{$fg[white]%}%n@%m${_RESET_COLOR} %{$fg[green]%}$(shpwd)${_RESET_COLOR} $(git_super_status)> '

if [ ! -d ~/.zsh ]; then
  mkdir ~/.zsh
fi
source ${HOME}/repos/src/github.com/darmats/sh.conf/entrypoint.zsh

if [ -f ~/.zsh/.zsh ]; then
  source ~/.zsh/.zsh
fi
