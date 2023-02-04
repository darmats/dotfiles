if [ -z ${DOTFILES_DIR} ]; then
  DOTFILES_DIR=$(cd $(dirname $0); pwd)
fi

load_config() {
  local list=(
    shell
    brew
    docker
    direnv
    fzf
    golang
      ghq
      git
    rust
    volta
  )

  for name in $list; do
    local file=${DOTFILES_DIR}/zsh/${name}.zsh
    if [ -f $file ]; then
      source $file
      # echo $file
    fi
  done
}

load_config
