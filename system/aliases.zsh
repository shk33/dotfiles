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
alias adg='sudo apt-get update && sudo apt-get upgrade'
alias ai='sudo apt-get install'
alias ad='sudo apt-get update'
alias ag='sudo apt-get upgrade'
alias cl='clear'
alias open='xdg-open . &> /dev/null'
if (( $+commands[php] ))
then
  alias phpserve='php -S 0.0.0.0:8000'
fi
