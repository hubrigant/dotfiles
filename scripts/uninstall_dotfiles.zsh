#!/usr/bin/env zsh

cd ${HOME}
echo ${PWD}
rm -rf .bundles.vim .gitignore_global .tmux .vim .vimrc.old .zgen* .zshrc INSTALL.md README.md bin/setproxy.sh aliases
cp ${HOME}/dotfiles.bkup/.* .
rm -rf .dotfiles
