# ***NOTE***
__At the time of this commit, these instructions are incomplete and I haven't worked all the bugs out of the configurations. Until this notice is removed, proceed with caution.__

# Introduction
I started down this path to synchronize my standard dotfiles across my UNIX-like computers, which are macOS and raspbian based. I've spent quite a bit of time tuning these to my liking, and they reflect my particular set of interests (i.e. I do much of my programming in Python and not much in other languages, so my vim configurations reflect this).

## Prerequisites
This set of configurations are predicated on zsh and vim, and to a lesser extent iTerm2 (which is only available on macOS). Naturally, those need to be installed for this repo to be of much use.

## Get zgen
zgen is a plugin manager for zsh. Most of the zsh-level plugins are installed and managed by zgen, so it needs to be in place first:

```
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
```

## Get the repo cloned
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
