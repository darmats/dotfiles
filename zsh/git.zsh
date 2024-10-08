if [ -z $(command -v git) ]; then
  return
fi

function _git_current_branch() {
  local branch=$(git rev-parse --abbrev-ref HEAD)
  if [ ${branch} = "HEAD" ]; then
    return
  fi
  echo ${branch}
}

alias g='git'
alias ga='git add'
alias ga.='git add .'
alias gs='git status -s'
alias gst='git stash'
alias gsts='git stash save'
alias gstl='git stash list'
alias gstp='git stash pop'
function gsta() {
  git stash apply stash@{$1};
}
function gstd() {
  git stash drop stash@{$1};
}
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcp='git cherry-pick'
function gcot() {
  git fetch && git checkout origin/$1;
}
function gcop() {
  git checkout $1 && git pull
}
alias gb='git branch'
alias gbv='git branch -vv'
alias gba='git branch -a'
alias gf='git fetch'
alias gfp='git fetch --prune'
alias gd='git diff'
alias gdc='git diff --cached'
alias gpull='git pull'
alias gpl='gpull'
alias gplr='git pull --rebase'
alias gpush='git push'
alias gpsh='gpush'
alias gpso='git push -u origin HEAD'
alias grb='git rebase'
function grbi() {
  if [ $# -eq 0 ]; then
    git rebase -i --committer-date-is-author-date
  else
    git rebase -i HEAD~$1 --committer-date-is-author-date
  fi
}
alias grbc='git rebase --continue'
alias greset='git reset'
alias gca='GIT_COMMITTER_DATE=$(git log -1 --format=%aD) git commit --amend --cleanup=scissors'
alias gcan='GIT_COMMITTER_DATE=$(git log -1 --format=%aD) git commit --amend --no-edit'
function gcm() {
  if [ $# -eq 0 ]; then
    git commit --cleanup=scissors
  else
    git commit -m $@
  fi
}
alias gcv='git commit -v --cleanup=scissors'
alias gicm='git commit --allow-empty -m "Initial commit."'
alias gmai='git switch main && git pull'
alias gmas='git switch master && git pull'
alias gdev='git switch develop && git pull'
alias gl='git log'
alias glo='gl --oneline'
alias glg="gl --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %Cblue<%an>%Creset' --abbrev-commit --date=relative"
alias glga="glg --all"
alias glge="gl --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %Cblue<%an (%ae)>%Creset' --abbrev-commit --date=relative"
alias glgea="glge --all"
alias glgm="glg --merges"
alias glgma="glgm --all"
alias glc='git shortlog -sn --no-merges'
alias gsw='git switch'
function gswf() {
  local branches branch
  branches=$(git --no-pager branch -vv) &&
  branch=$(echo "$branches" | fzf) &&
  git switch $(echo "$branch" | cut -c 3- | awk '{print $1}')
}
alias gswc='git switch -c'
function gswcf() {
  if [ $# -eq 0 ]; then
    echo "Usage: gswcf [feature-name]"
    return 1
  else
    git switch -c feature/$1
  fi
}
function gswch() {
  if [ $# -eq 0 ]; then
    echo "Usage: gswch [hotfix-name]"
    return 1
  else
    git switch -c hotfix/$1
  fi
}
alias grs='git restore'

alias gdelmrgd='git fetch && git branch --merged | egrep -v "\\*|main|master|develop" | xargs -I % git branch -d %'
alias glsremote='git config -l | grep $(_git_current_branch)'
alias gsetremote='git branch -u origin/$(_git_current_branch)'
alias gunsetremote='git config --unset branch.$(_git_current_branch).merge && git config --unset branch.$(_git_current_branch).remote'

alias gskip='git update-index --skip-worktree'
alias gckskip='git ls-files -v | grep ^S'
alias gnoskip='git update-index --no-skip-worktree'

function g-dir() {
  local dir=$(git rev-parse --show-toplevel 2> /dev/null)
  if [ -z ${dir} ]; then
    return 1
  fi
  basename ${dir}
}
function g-repo() {
  local url=$(git config --get remote.origin.url)
  if [ -z ${url} ]; then
    return 1
  fi
  basename -s .git ${url}
}


source $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/git/git-prompt.zsh

# for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo
# GIT_BASE_COLOR="%{\e[38;5;110m%}"
GIT_BASE_COLOR="%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_PREFIX="${GIT_BASE_COLOR}("
ZSH_THEME_GIT_PROMPT_SUFFIX="${GIT_BASE_COLOR})${_RESET_COLOR}"
ZSH_THEME_GIT_PROMPT_SEPARATOR="${GIT_BASE_COLOR}|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[magenta]%}%{x%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[red]%}%{+%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[green]%}%{↘%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[green]%}%{↗%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}%{✔%G%}"
