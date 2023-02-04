if [ -z $GHQ_ROOT ]; then
  export GHQ_ROOT=${GOPATH}/src
fi

if [ -z $(command -v ghq) ]; then
  return
fi

alias gg='ghq get'

if [ -n $(command -v fzf) ]; then
  function re() {
    if [ $# -eq 0 ]; then
      echo "Usage: $0 [pattern]"
      return 1
    else
      cd ${GHQ_ROOT}/$(ghq list | grep $1 | FZF_DEFAULT_OPTS="" fzf)
    fi
  }
  alias rea='cd ${GHQ_ROOT}/$(ghq list | FZF_DEFAULT_OPTS="" fzf)'
  function _ghq_full_path() {
    awk -v root=${GHQ_ROOT} '{print root"/"$1}'
  }
  alias -g reags='ghq list | FZF_DEFAULT_OPTS="" fzf | _ghq_full_path | xargs '
fi
