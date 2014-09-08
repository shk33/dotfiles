# From http://dotfiles.org/~_why/.zshrc
# Sets the window title nicely no matter where you are
function title() {

  a=${(V)1//\%/\%\%}

  # Truncate command, and join lines.
  a=$(print -Pn "%40>...>$a" | tr -d "\n")

  case $TERM in
  screen)
    print -Pn "\ek$a:$3\e\\" # screen title (in ^A")
    ;;
  xterm*|rxvt)
    print -Pn  "\e]2;🐣%{$2:q%}\a" # plain xterm title ($3 for pwd)
    print -Pn "\e]1;$1:q\a" #set icon (=tab) name (will override window name on broken terminal)
    ;;
  esac
}
