# Installation instructions

## Prerequisites
Obviously, this repo depends on using [git](https://git-scm.com/), so make sure you have a current release installed.

The vim-easytags plugin depends on a better ctags implementation than what comes with macOS, so install universal-ctags with the following commands:

```
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags
```

This set of configurations are predicated on [zsh](https://www.zsh.org/) and [vim](https://www.vim.org/), and to a lesser extent [iTerm2](https://iterm2.com/) (which is only available on macOS). Naturally, those need to be installed for this repo to be of much use. Some of the plugins use [Python](https://www.python.org/), so a current version of that is also needed. As with git, most modern operating systems include versions of zsh, vim, and python, upgrading to the most recent stable
version of each is recommended.

Of special note, the YouCompleteMe vim plugin does not like virtual environment versions of Python (e.g. anaconda, pyenv). On a Mac, the best bet for getting a current version is to install python2 and python3 via homebrew.

Some of the prompt modifications from oh-my-zsh and powerline9k rely on special glyph characters from either the [nerd fonts](https://nerdfonts.com/) or [powerline fonts](https://github.com/powerline/fonts) collections. These should be installed on your workstations if you intend to use this functionality in your prompts. My configurations do use some, particularly triangle separators between segments and git repo segments.

If you have run through all or part of this process and backed everything off, you'll likely need to unset the ZSH environment variable by typing ```unset ZSH```

The YouCompleteMe core library build depends on [cmake](https://cmake.org/). If it's not installed already, use your operating system's package manager (e.g. [yum](http://yum.baseurl.org/) or [apt-get](https://wiki.debian.org/Apt) on most Linuxes, [homebrew](https://brew.sh/) on macOS, etc.)

The terminal multiplexer [tmux](https://github.com/tmux/tmux/wiki) is an integral part of this config. It also needs to be installed prior to this process.

While not directly tied to the dotfiles in this repo, I've found [autojump](https://github.com/wting/autojump) to be a very useful addition to my shell toolbox.

## Automated installation steps

1) Ensure prerequisites are installed (the installer script should check for this and give appropriate errors)
1) Prime your home directory to be ready for cloning
1) Clone this repo (if you haven't already)
1) Run the install script ```/.dotfiles/scripts/install_dotfiles.sh```

## Manual install
If you don't want to, or can't, use the install script, the following are the steps to perform the installation manually.

### Install autosuggestions plugin
The [autosuggestions plugin](https://github.com/zsh-users/zsh-autosuggestions) is the only oh-my-zsh plugin I use that can't be installed yet via zgen, so you'll have to do this manually.

### Create links to managed dotfiles
```
rm ~/.aliases
rm ~/.bundles.vim
rm ~/.gitconfig
rm ~/.gitignore_global
rm ~/.tmux.conf
rm ~/.vimrc
rm ~/.zgen.conf
rm ~/.zshrc

ln ~/.dotfiles/dots/common/aliases                  ~/.aliases
ln ~/.dotfiles/dots/common/bundles.vim              ~/.bundles.vim
ln ~/.dotfiles/dots/common/gitconfig                ~/.gitconfig
ln ~/.dotfiles/dots/common/gitignore_global         ~/.gitignore_global
ln ~/.dotfiles/dots/common/tmux.conf                ~/.tmux.conf
ln ~/.dotfiles/dots/common/vimrc                    ~/.vimrc
ln ~/.dotfiles/dots/common/zgen                     ~/.zgen.conf
ln ~/.dotfiles/dots/common/zshrc                    ~/.zshrc
```

### Get zgen
[zgen](https://github.com/tarjoilija/zgen) is a plugin manager for zsh. Most of the zsh-level plugins are installed and managed by zgen, so it needs to be in place first:

```
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
```

and then activate the new configuration by typing ```source ~/.zshrc```. This should trigger zgen to pull down the plugins listed in the zshrc file.

### Get vim plugins
The [Vundle vim plugin manager] should be installed by zgen. Once it's available, tell Vundle to install the vim plugins by entering the command ```vim +PluginInstall +qall```

### Build the YCM library
One of the vim plugins, YouCompleteMe, needs to have its core libraries built. To do this, use the following commands:

```
cd ~/.vim/bundle/Vundle.vim/YouCompleteMe
./install.py
```

## Local machine-specific configurations
If you have configurations that are specific to a particular machine, such as OS-dependent things, they can be stored in the file ```~/.machinerc``` that is not tracked as part of this repo. Naturally, this file should be listed in your .gitignore.
