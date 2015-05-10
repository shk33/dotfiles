# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
# if $(gls &>/dev/null)
# then
#   alias ls="gls -F --color"
#   alias l="gls -lAh --color"
#   alias ll="gls -l --color"
#   alias la='gls -A --color'
# fi
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

alias start-apache='sudo service apache2 start'
alias restart-apache='sudo service apache2 restart'
alias stop-apache='sudo service apache2 stop'
