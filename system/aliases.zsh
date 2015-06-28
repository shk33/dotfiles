alias bye='exit'
alias adg='sudo apt-get update && sudo apt-get upgrade -y'
alias ai='sudo apt-get install -y'
alias ad='sudo apt-get update'
alias ag='sudo apt-get upgrade -y'
alias cl='clear'
alias open='xdg-open . &> /dev/null'
alias fucking='sudo'


if (( $+commands[sudo] ))
then
  alias bythepowerofgreyskull='sudo'
fi

alias webserver='python -m SimpleHTTPServer 9090'

# LAMP Management
alias start-mysql='sudo service mysql start'
alias restart-mysql='sudo service mysql restart'
alias stop-mysql='sudo service mysql stop'

alias start-postgresql='sudo service postgresql start'
alias restart-postgresql='sudo service postgresql restart'
alias stop-postgresql='sudo service postgresql stop'

alias start-apache='sudo service apache2 start'
alias restart-apache='sudo service apache2 restart'
alias stop-apache='sudo service apache2 stop'
