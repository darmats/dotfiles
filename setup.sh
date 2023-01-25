DOTFILES_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
cd ${DOTFILES_DIR}

setup() {
  if [ -z $(command -v brew) ]; then
    echo "Please install Homebrew."
    exit 1
  fi

  brew bundle

  if [ -z $(command -v git) ]; then
    echo "Please install git."
    exit 1
  fi

  if [ -f ~/.zcompdump ]; then
    rm -f ~/.zcompdump
  fi

  cd ${HOME}
  if [ ! -L .zshrc ]; then
    ln -s .dotfiles/.zshrc .zshrc
  fi
  if [ ! -L .config ]; then
    ln -s .dotfiles/.config .config
  fi

  if [ ! -f ${HOME}/repos/bin/gitstatus ]; then
    GOPATH=$HOME/repos go install github.com/darmats/go-gitstatus/gitstatus@latest
  fi

  cd ${DOTFILES_DIR}
  if [ ! -f .gitconfig ]; then
    cp .gitconfig.example .gitconfig
  fi
}

setup
