# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
# hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git='hub'
fi

# The rest of my fun git aliases
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gcam='git commit -a -m'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcb='git copy-branch-name'
alias gb='git branch -v'
alias grmt='git remote -v'
alias gst='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
#alias gst='git status'  # just if you want to see all git comments
alias glom='git pull origin master'
alias gpom='git push origin master'
alias g='git'
alias ga='git add'
alias guncache='git rm --cached -r '
alias gcln='git clone'
alias gcreate='git create -d'
alias ginit='git init'
alias gundo='git undo'
alias gw='git whatchanged'
alias gf='git fetch origin'
alias git-ignore='git rm -r --cached . && echo "*** Cache clean, now add all files ***"'
alias gig=git-ignore
alias sequelize='node_modules/.bin/sequelize'
alias seq='node_modules/.bin/sequelize'
alias pgadmin='~/pgadmin4/pgadmin4'
alias javaselect='sudo update-alternatives --config java'
alias docgen='apidoc -i apidoc/ -o apidoc/output'
