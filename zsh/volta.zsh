if [ -z $(command -v volta) ]; then
  return
fi

export VOLTA_HOME="${HOME}/.volta"
export PATH="${VOLTA_HOME}/bin:$PATH"
