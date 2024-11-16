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
    alias date-ymd='date +"%Y%m%d"'
    alias date-ymdhms='date +"%Y%m%d%H%M%S"'
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
