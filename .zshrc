CONF_ZSH_PROMPT=$'%{$fg[white]%}%n@%m${_RESET_COLOR} %{$fg[green]%}$(shpwd)${_RESET_COLOR} $(git_super_status)> '

source ${HOME}/repos/src/github.com/darmats/sh.conf/entrypoint.zsh
