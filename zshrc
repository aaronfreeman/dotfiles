script_dir=$(dirname "$0")
script_dir=$(cd "$script_dir" && pwd)

# Aliases
alias grep='grep --color=auto'
alias ls="eza --icons"
alias ll="eza -lah --icons"
alias la="eza -a --icons"
alias lt="eza --tree --icons"
alias cat="bat --paging=never"
alias gs="git s"
alias ga="git a"
alias gc="git c $1"
alias gph="pre-push && git ph"
alias gpt="git push --tags"
alias gp="git pull"
alias gpm="git pull origin main"
alias gmm="git fetch origin && git merge origin/main"
alias gmt="git merge test"
alias gmd="git merge dev"
alias gm="git merge $1"
alias gcm="git main"
alias gct="git co test"
alias gco='git co $1'
alias gcd='git co dev'
alias gcob='git cob $1'
alias br='bun run $1'
alias delb='git branch | grep -v -e " main" -e " master" | xargs git branch -D'
alias dotfiles="git -C $script_dir pull > /dev/null 2>&1 && $script_dir/setup.sh"
alias resource="source $HOME/.zshrc"

export PATH=".:$HOME/.local/bin:$PATH"

eval "$(mise activate zsh)"

wt() {
  if [[ $# -ne 1 ]]; then
    echo "Usage: wt <branch-name>" >&2
    return 1
  fi
  local branch="$1"
  local worktree_path="$HOME/Projects/worktrees/$(basename "$(pwd)")-${branch}"
  git worktree add "$worktree_path" -b "$branch" && \
    mise trust "$worktree_path"
    cd "$worktree_path"
}

wtd() {
  local branch=$(git branch --show-current)
  local current_dir=$(pwd)
  local main_dir=$(git worktree list | head -1 | awk '{print $1}')
  cd "$main_dir"
  git worktree remove "$current_dir"
  git branch -d "$branch"
}
