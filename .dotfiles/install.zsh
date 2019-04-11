#!/bin/zsh

# if zgen isn't installed, install it
if [[ ! -d ~/.zgen ]]; then
    git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
else
    echo "zgen already installed, continuing..."
fi

# activate zgen
source ${HOME}/.zgen/zgen.zsh

if ! zgen saved; then
    echo "zgen init script doesn't exist, so creating it..."
    # install plugins

    # generate the init script from plugins above
    zgen save
fi

### Copied from https://www.outcoldman.com/en/archive/2015/09/13/keep-your-sh-together/

## Change shell for current user to zsh
if [ ! "$SHELL" = "/usr/local/bin/zsh" ]; then
    chsh -s /usr/local/bin/zsh
else
    echo "ZSH is already my shell"
fi

# remove old dot files
echo "Removing old home-dir dot files"
rm ~/.gitconfig
rm ~/.gitignore_global
rm ~/.tmux.conf
rm ~/.vimrc
rm ~/.zshrc
rm ~/.bundles.vim

# link new dot files
echo "Creating hard links of dot files"
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


# install powerline fonts if they're not already installed
if [[ ! `find ~/Library/Fonts/ -name "*Powerline*"` ]]; then
    ~/.dotfiles/powerline-fonts/install.sh
else
    echo "Powerline fonts already installed"
fi

if [[ ! `find ~/.dotfiles -name zsh-autosuggestions` ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi

