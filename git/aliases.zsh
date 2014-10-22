# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias git='hub'
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gcam='git commit -a -m'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias grmt='git remote'
#alias gst='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gst='git status'
alias glom='git pull origin master'
alias gpom='git push origin master'
alias g='hub'
alias ga='git add'
alias guncache='git rm --cached -r '
alias gcln='git clone'
alias gcreate='git create -d'
alias ginit='git init'
alias gundo='git undo'
