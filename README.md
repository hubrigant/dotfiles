# ***NOTE***
__At the time of this commit, these instructions are incomplete and I haven't worked all the bugs out of the configurations. Until this notice is removed, proceed with caution.__

# Introduction
I started down this path to synchronize my standard dotfiles across my UNIX-like computers, which are macOS and raspbian based. I've spent quite a bit of time tuning these to my liking, and they reflect my particular set of interests (i.e. I do much of my programming in Python and not much in other languages, so my vim configurations reflect this).

## Prerequisites
This set of configurations are predicated on [zsh](https://www.zsh.org/) and [vim](https://www.vim.org/), and to a lesser extent [iTerm2](https://iterm2.com/) (which is only available on macOS). Naturally, those need to be installed for this repo to be of much use. Some of the plugins use [Python](https://www.python.org/), so a current version of that is also needed. While most modern operating systems include versions of zsh, vim, and python, upgrading to the most recent stable version of each is recommended.

Some of the prompt modifications from oh-my-zsh and powerline9k rely on special glyph characters from either the [nerd fonts](https://nerdfonts.com/) or [powerline fonts](https://github.com/powerline/fonts) collections. These should be installed on your workstations if you intend to use this functionality in your prompts. My configurations do use some, particularly triangle separators between segments and git repo segments.

If you have run through all or part of this process and backed everything off, you'll likely need to unset the ZSH environment variable by typing ```unset ZSH```

Obviously, this repo depends on using [git]()

## Get zgen
[zgen](https://github.com/tarjoilija/zgen) is a plugin manager for zsh. Most of the zsh-level plugins are installed and managed by zgen, so it needs to be in place first:

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

and then activate the new configuration by typing ```source ~/.zshrc```. This should trigger zgen to pull down the plugins listed in the zshrc file.

## Configure zgen as a submodule
I don't want to be redistributing other people's code, so the external parts should be configured as submodules.

```
git submodule init
```

## Get vim plugins
The [Vundle vim plugin manager] should be installed by zgen. Once it's available, tell Vundle to install the vim plugins by entering the command ```vim +PluginInstall +qall```

## Build the YCM library
One of the vim plugins, YouCompleteMe, needs to have its core libraries built. To do this, use the following commands:

```
cd ~/.vim/bundle/Vundle.vim/YouCompleteMe
./install.py
```
## Update .gitignore
Since this repo only manages dotfiles for zsh, oh-my-zsh, zgen, vim, and Vundle, the rest of the files and directories in your home directory need to be excluded by updating the [.gitignore](https://git-scm.com/docs/gitignore) file in the root of your home directory.
