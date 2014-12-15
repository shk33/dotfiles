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

For example, you can run `adg` in the command line an as an equivalent of `sudo apt-get update && sudo apt-get upgrade` in order to upgrade your Ubuntu SO

## Dependencies
There are some dependecies that you may have to install
* [Ruby using rbenv](https://gorails.com/setup/ubuntu/14.04)
* [Nodejs using nvm](https://github.com/creationix/nvm)

And then
* [hub](https://hub.github.com/)

## Thanks to [joseramonc](https://github.com/joseramonc) and [holman](https://github.com/holman)

If you have some troubles installing these dotfiles or any other issue, you can send me a mail o leave an issue in the issue tracker.

Thanks a lot. :heart:
