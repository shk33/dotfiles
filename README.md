# @arandilopez dotfiles

My .dotfiles, forked from [holman dotfiles](https://github.com/holman/dotfiles), optimized for ubuntu 14.04, with all the :heart:

# Install

Run this:

    git clone https://github.com/arandilopez/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    script/bootstrap
This will symlink the appropriate files in .dotfiles to your home directory. Everything is configured and tweaked within ~/.dotfiles.

The main file you'll want to change right off the bat is zsh/zshrc.symlink, which sets up a few paths that'll be different on your particular machine.

Added some git alias and [hub](https://github.com/github/hub) support. Also with apt-get alias and some features more.

## Thanks to [joseramonc](https://github.com/joseramonc) and [holman](https://github.com/holman)
