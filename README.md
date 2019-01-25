# @arandilopez dotfiles

My .dotfiles, forked from [holman dotfiles](https://github.com/holman/dotfiles), optimized for Ubuntu 14.04, with all the :heart:

# Install

## Dependencies

For this dotfiles version you need to install zsh. To install zsh just run:

    sudo apt-get install zsh
    chsh -s `which zsh`

Then logout and login again to see changes.

There are some dependecies that you must to install
* [Ruby using rbenv](https://gorails.com/setup/ubuntu/14.04)
* [Nodejs using nvm](https://github.com/creationix/nvm)

And then
* [hub](https://hub.github.com/) (This is optional)

## Install this dotfiles
Run this:

    git clone git@github.com:shk33/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    script/bootstrap

This will symlink the appropriate files in .dotfiles to your home directory. Everything is configured and tweaked within ~/.dotfiles.

The main file you'll want to change right off the bat is zsh/zshrc.symlink, which sets up a few paths that'll be different on your particular machine.

I have added some git alias and [hub](https://github.com/github/hub) support. Also with apt-get alias and some features more.

For example, you can run `adg` in the command line an as an equivalent of `sudo apt-get update && sudo apt-get upgrade` in order to upgrade your Ubuntu SO

## Thanks to [joseramonc](https://github.com/joseramonc) and [holman](https://github.com/holman)

If you have some troubles installing these dotfiles or any other issue, you can send me a mail o leave an issue in the issue tracker.

Thanks a lot. :heart:

## TODO

- Write wiki to document all features.
