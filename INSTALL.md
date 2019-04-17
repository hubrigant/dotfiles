# Installation instructions

## Prerequisites
Obviously, this repo depends on using [git](https://git-scm.com/), so make sure you have a current release installed.

This set of configurations are predicated on [zsh](https://www.zsh.org/) and [vim](https://www.vim.org/), and to a lesser extent [iTerm2](https://iterm2.com/) (which is only available on macOS). Naturally, those need to be installed for this repo to be of much use. Some of the plugins use [Python](https://www.python.org/), so a current version of that is also needed. As with git, most modern operating systems include versions of zsh, vim, and python, upgrading to the most recent stable version of each is recommended.

Some of the prompt modifications from oh-my-zsh and powerline9k rely on special glyph characters from either the [nerd fonts](https://nerdfonts.com/) or [powerline fonts](https://github.com/powerline/fonts) collections. These should be installed on your workstations if you intend to use this functionality in your prompts. My configurations do use some, particularly triangle separators between segments and git repo segments.

If you have run through all or part of this process and backed everything off, you'll likely need to unset the ZSH environment variable by typing ```unset ZSH```

The YouCompleteMe core library build depends on [cmake](https://cmake.org/). If it's not installed already, use your operating system's package manager (e.g. [yum](http://yum.baseurl.org/) or [apt-get](https://wiki.debian.org/Apt) on most Linuxes, [homebrew](https://brew.sh/) on macOS, etc.)

The terminal multiplexer [tmux](https://github.com/tmux/tmux/wiki) is an integral part of this config. It also needs to be installed prior to this process.

## Installation steps

1) Ensure prerequisites are installed (the installer script should check for this and give appropriate errors)
1) Prime your home directory to be ready for cloning
1) Clone this repo (if you haven't already)
1) Run the install script 
