# ZSH_THEME="robbyrussell"
autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo " $(git_tag)%{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo " $(git_tag)%{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_tag(){
  echo "%{$fg_bold[blue]%}git@"
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
 #echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo ""
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%}"
  fi
}

ruby_version() {
  if (( $+commands[rbenv] ))
  then
    echo "$(rbenv version | awk '{print $1}')"
  fi

  if (( $+commands[rvm-prompt] ))
  then
    echo "$(rvm-prompt | awk '{print $1}')"
  fi
}

node_version(){
  if (( $+commands[node] ))
  then
    echo "$(node -v | awk '{print $1}')"
  fi
}

php_version() {
  if (( $+commands[php] ))
  then
    echo "$(php -i | grep 'PHP Version' -m 1 | awk 'match($4, /[0-9]*(.[0-9]*)(.[0-9]*)/) {print substr($4, RSTART, RLENGTH)}')"
  fi
}

rb_prompt() {
  if ! [[ -z "$(ruby_version)" ]]
  then
    echo "%{$fg_bold[red]%}rb: $(ruby_version)%{$reset_color%}"
  else
    echo ""
  fi
}

nd_prompt(){
  if ! [[ -z "$(node_version)" ]]
  then
    echo "%{$fg_bold[green]%}nd: $(node_version)%{$reset_color%}"
  else
    echo ""
  fi
}

php_prompt() {
  if ! [[ -z "$(php_version)" ]];
  then
    echo "%{$fg_bold[magenta]%}php: $(php_version)%{$reset_color%}"
  else
    echo ""
  fi
}

directory_name() {
  echo "%{$fg_bold[cyan]%}%1/%\%{$reset_color%}"
}

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

# emojis in the prompt.
export PROMPT=$'${ret_status} $(directory_name)$(git_dirty)$(need_push)%(?: %{$fg_bold[green]%}➤ : %{$fg_bold[red]%}!➤ %s)%{$reset_color%}'
set_prompt () {
  export RPROMPT="$(php_prompt) $(rb_prompt) $(nd_prompt)"
}

precmd() {
  #title "zsh" "%m" "%55<...<%~"
  set_prompt
}
