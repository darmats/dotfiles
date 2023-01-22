cd "$(dirname "${BASH_SOURCE:-$0}")"

setup() {
  if [ -z $(command -v brew) ]; then
    echo "Please install Homebrew."
    exit 1
  fi

  brew bundle
}

setup
