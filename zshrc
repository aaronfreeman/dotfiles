plugins=(vscode asdf gradle)

script_dir=$(dirname "$0")
script_dir=$(cd "$script_dir" && pwd)

# Aliases
alias grep='grep --color=auto'
alias ls='ls -G'
alias gs="git s"
alias ga="git a"
alias gc="git c $1"
alias gph="git ph"
alias gpt="git push --tags"
alias gp="git pull"
alias gpm="git pull origin main"
alias gmm="git merge main"
alias gmt="git merge test"
alias gmd="git merge dev"
alias gm="git merge $1"
alias gcm="git co main"
alias gct="git co test"
alias gco='git co $1'
alias gcd='git co dev'
alias gcob='git cob $1'
alias br='bun run $1'
alias delb='git branch | grep -v "main" | xargs git branch -D'
alias dotfiles="git -C $script_dir pull > /dev/null 2>&1 && $script_dir/setup.sh"

# Adding things to my path
export PATH=.:$PATH:~/.bin

. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
