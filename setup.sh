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

  cd ${DOTFILES_DIR}
  if [ ! -f .gitconfig ]; then
    cp .gitconfig.example .gitconfig
  fi

  cd ${HOME}
  if [ ! -L .zshrc ]; then
    ln -s .dotfiles/.zshrc .zshrc
  fi
  if [ ! -L .gitconfig ]; then
    ln -s .dotfiles/.gitconfig .gitconfig
  fi
  if [ ! -d .config ]; then
    mkdir .config
  fi

  cd ${HOME}/.config
  if [ ! -L git ]; then
    ln -s ../.dotfiles/.config/git git
  fi

  if [ ! -f ${HOME}/repos/bin/gitstatus ]; then
    GOPATH=$HOME/repos go install github.com/darmats/go-gitstatus/gitstatus@latest
  fi
}

setup
