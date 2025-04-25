# Thanks to Oh My ZSH and https://github.com/pi0
# Laravel 5 basic command completion
_laravel5_get_command_list () {
  php artisan --no-ansi | sed "1,/Available commands/d" | awk '/^ +[a-z]+/ { print $1 }'
}

_laravel5 () {
  if [ -f artisan ]; then
    compadd `_laravel5_get_command_list`
  fi
}

# Only define completion if compdef exists
if type compdef &>/dev/null; then
  compdef _laravel5 artisan
fi

# Alias
alias artisan='php artisan'
