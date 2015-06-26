#
# Alias file for php
#
if (( $+commands[php] ))
  then
  alias php-serve='php -S 0.0.0.0:8000'
fi

alias ci='composer install'
alias cu='composer update'
alias cr='composer require'
