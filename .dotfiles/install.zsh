#!/bin/zsh

### Copied from https://www.outcoldman.com/en/archive/2015/09/13/keep-your-sh-together/

## Change shell for current user to zsh
if [ ! "$SHELL" = "/usr/local/bin/zsh" ]; then
    chsh -s /usr/local/bin/zsh
fi

# remove old dot files
rm ~/.gitconfig
rm ~/.gitignore_global
rm ~/.tmux.conf
rm ~/.vimrc
rm ~/.zshrc
rm ~/.bundle.vim

# link new dot files
ln ~/.dotfiles/dots/common/gitconfig                ~/.gitconfig
ln ~/.dotfiles/dots/common/gitignore_global         ~/.gitignore_global
ln ~/.dotfiles/dots/common/tmux.conf                ~/.tmux.conf
ln ~/.dotfiles/dots/common/vimrc                    ~/.vimrc
ln ~/.dotfiles/dots/common/zshrc                    ~/.zshrc
ln ~/.dotfiles/dots/common/bundles.vim              ~/.bundles.vim

# Do special to sync sublime settings on OS X
# Since I don't use Sublime at the moment, commenting this out
# I'll re-enable it later if Sublime gets used more
#
#if [[ "$OSTYPE" =~ "darwin" ]]; then
#    rm ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
#    ln -s ~/.dotfiles/settings/SublimeText/User      ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
#fi


# install powerline fonts
~/.dotfiles/powerline-fonts/install.sh
