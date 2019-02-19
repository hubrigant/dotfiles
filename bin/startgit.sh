#!/bin/sh

git init --separate-git .
git remote add -f origin https://github.com/hubrigant/dotfiles
git remote set-head origin -a
git checkout master
rm .git
echo '*' > .dotfiles.git/info/exclude
