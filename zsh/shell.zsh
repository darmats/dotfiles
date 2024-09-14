case "${OSTYPE}" in
  darwin* )
    alias ls='ls -G'
    alias lh='ls -lhG'
    if [ -z $(command -v eza) ]; then
      alias l='ls -1G'
      alias ll='ls -lG'
      alias la='ls -lGa'
    else
      alias l='eza -1 --git'
      alias ll='eza -l --git'
      alias la='eza -la --git'
      alias lb='eza -lB --git'
      alias lab='eza -laB --git'
    fi
    alias tlf='tail -f'
    alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]"'
    ;;
  linux* )
    alias cp='cp -i'
    alias egrep='egrep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias grep='grep --color=auto'
    alias l='ls -1 --color=auto'
    alias l.='ls -d .* --color=auto'
    alias ls='ls --color=auto'
    alias ll='ls -l --color=auto'
    alias la='ls -la --color=auto'
    alias lh='ls -lha --color=auto'
    alias mv='mv -i'
    alias rm='rm -i'
    ;;
  * )
    echo "Unexpected \${OSTYPE}: ${OSTYPE}"
    ;;
esac

alias lns='ln -s'
function mdr() {
  mkdir -p "$@" && cd "$@"
}

export PATH="/usr/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"



source $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/shell/prompt.zsh
