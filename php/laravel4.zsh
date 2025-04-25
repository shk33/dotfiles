# Thanks to Oh My ZSH and https://github.com/pi0
# Laravel4 basic command completion
_laravel4_get_command_list () {
  php artisan --no-ansi | sed "1,/Available commands/d" | awk '/^ +[a-z]+/ { print $1 }'
}

_laravel4 () {
  if [ -f artisan ]; then
    compadd `_laravel4_get_command_list`
  fi
}

# Only define completion if compdef exists
if type compdef &>/dev/null; then
  compdef _laravel4 artisan
fi

# Alias
alias artisan='php artisan'
