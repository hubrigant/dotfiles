#!/bin/sh

git init --separate-git .
git remote add -f origin https://github.com/hubrigant/dotfiles
git remote set-head origin -a
git checkout master
git clone -f --separate-git-dir=.dotfiles.git https://github.com/hubrigant/dotfiles .
rm .git
echo '*' > .dotfiles.git/info/exclude
