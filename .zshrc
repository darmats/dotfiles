#CONF_ZSH_PROMPT=$'%m:%F{cyan}%n%f %F{yellow}%c%f $(git_status)%% '
CONF_ZSH_PROMPT=$'%{$fg[white]%}%n@%m${_RESET_COLOR} %{$fg[green]%}$(shpwd)${_RESET_COLOR} $(git_status)> '

if [ ! -d ~/.zsh ]; then
  mkdir ~/.zsh
fi

if [ -f ~/.zsh/pre.zsh ]; then
  source ~/.zsh/pre.zsh
fi



zstyle -T ':completion:*:*:git:*' tag-order && \
  zstyle ':completion:*:*:git:*' tag-order 'alias-commands' 'common-commands'

# Lines configured by zsh-newuser-install
# HISTFILE=~/.histfile
if [ ! -d ~/.zsh ]; then
  mkdir ~/.zsh
fi
HISTFILE=~/.zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$($HOME)/.zshrc'
# zstyle :compinstall filename '$(${CNF_ROOT})/entrypoint.zsh'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall

# shell
setopt hist_ignore_dups



source ~/.dotfiles/root.zsh

autoload -Uz compinit
compinit

if [ -f ~/.zsh/post.zsh ]; then
  source ~/.zsh/post.zsh
fi
