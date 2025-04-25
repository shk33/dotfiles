export PYENV_PATH="$HOME/.pyenv/bin"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
export ANDROID_HOME="$HOME/Android/Sdk"
export MOZILLA_FIVE_HOME="/usr/lib/mozilla"
export GOROOT="/usr/local/go"
export GOPATH="/usr/local/go/bin"
export HUB="$HOME/hub-linux-amd64-2.2.9/bin"
export ANDROID_STUDIO="/usr/local/android-studio/bin"
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
export NODE_MODULES_PATH="./node_modules/.bin:$PATH"
export LOCAL_BIN_PATH="/home/eduardo/.local/bin"
# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"
# PATH
export FLUTER_PATH=$PATH:/home/eduardo/flutter-sdk/flutter/bin
export PATH="$PYENV_PATH:$LOCAL_BIN_PATH:$JAVA_HOME:$ANDROID_STUDIO:$FLUTER_PATH:$HUB:$GOROOT:$GOPATH:./bin:/usr/local/bin:/usr/local/sbin:$ZSH/bin:$HOME/.config/composer/vendor/bin:$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"
export NVM_SYMLINK_CURRENT=true
export NODE_PATH=$NODE_PATH:$HOME/.nvm/versions/node/v6.11.0/lib/node_modules

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  if command -v pyenv-virtualenv-init 1>/dev/null 2>&1; then
    eval "$(pyenv virtualenv-init -)"
  fi
fi
