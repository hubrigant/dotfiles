# ***NOTE***
__At the time of this commit, these instructions are incomplete and I haven't worked all the bugs out of the configurations. Until this notice is removed, proceed with caution.__

# Introduction
I started down this path to synchronize my standard dotfiles across my UNIX-like computers, which are macOS and raspbian based. I've spent quite a bit of time tuning these to my liking, and they reflect my particular set of interests (i.e. I do much of my programming in Python and not much in other languages, so my vim configurations reflect this).

## Prerequisites
This set of configurations are predicated on zsh and vim, and to a lesser extent iTerm2 (which is only available on macOS). Naturally, those need to be installed for this repo to be of much use. Some of the plugins use Python, so a current version of that is also needed.

Some of the prompt modifications from oh-my-zsh and powerline9k rely on special glyph characters from either the [nerd fonts](https://nerdfonts.com/) or [powerline fonts](https://github.com/powerline/fonts) collections. These should be installed on your workstations if you intend to use this functionality in your prompts. My configurations do use some, particularly triangle separators between segments and git repo segments.

## Get zgen
zgen is a plugin manager for zsh. Most of the zsh-level plugins are installed and managed by zgen, so it needs to be in place first:

```
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
```

## Clone this repo
To clone the repo into your existing home directory:

```
git init .
git remote add -t \* -f origin https://github.com/hubrigant/dotfiles.git
git checkout master
```

Once checked out, create a hard link from the repo zshrc to .zshrc in your home directory:

```
ln ~/.dotfiles/dots/common/zshrc ~/.zshrc
```

## Configure zgen as a submodule
I don't want to be redistributing other people's code, so the external parts should be configured as submodules.

```
git submodule init
```

## Build the YCM library
```
cd ~/.vim/bundle/Vundle.vim/YouCompleteMe
./install.py
```
