plugins=(git vscode asdf gradle)

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
alias delb='git branch | grep -v "main" | xargs git branch -d'

# Adding things to my path
export PATH=.:$PATH:~/.bin
