#!/usr/bin/env zsh

cd ${HOME}
echo ${PWD}
rm -rf .gitconfig* .gitignore_global .vim .vimrc.old .zgen* .zshrc INSTALL.md README.md bin/setproxy.sh
cp ${HOME}/dotfiles.bkup/.* .
rm -rf .dotfiles
