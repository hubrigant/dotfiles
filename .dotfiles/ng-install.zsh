#!/usr/bin/env zsh

if [ ! -d "${HOME}/.dotfiles" ]; then
    echo "The dotfiles repo has not been cloned. Please do so now and try again."
    exit(1)
fi

if [ ! $(which git) ]; then
    echo "A git client is required. Please install and try again."
    exit(1)
fi

if [ ! $(which vim) ]; then
    echo "Much of these configurations deal with vim, which doesn't appear to be installed,"
    echo ""
    echo "Please install it and try again."
    exit(1)
fi

if [ ! $(which python) ]; then
    echo "Python is needed for some plugins and functionality."
    echo ""
    echo "Please install it and try again."
fi

if [ ! "$SHELL" =~ "zsh" ]; then
    chsh -s $(which zsh)
else
    echo "ZSH is already my shell, continuing."
fi

if $ZSH; then
    echo "ZSH environment variable set. Unsetting to prevent incorrect oh-my-zsh installation and config."
    unset ZSH
fi

if [ ! $(which cmake) ]; then
    echo "No cmake found. Please install and try again."
    exit(1)
fi

echo "Backing up old home-dir dot files before creating links"
mv ${HOME}/.gitconfig           ${HOME}/.gitconfig.old
mv ${HOME}/.gitignore_global    ${HOME}/.gitignore_global.old
mv ${HOME}/.tmux.conf           ${HOME}/.tmux.conf.old
mv ${HOME}/.vimrc               ${HOME}/.vimrc.old
mv ${HOME}/.zshrc               ${HOME}/.zshrc.old
mv ${HOME}/.bundles.vim         ${HOME}/.bundles.vim.old

# link new dot files
echo "Creating hard links of dot files"
ln ${HOME}/.dotfiles/dots/common/gitconfig                ${HOME}/.gitconfig
ln ${HOME}/.dotfiles/dots/common/gitignore_global         ${HOME}/.gitignore_global
ln ${HOME}/.dotfiles/dots/common/vimrc                    ${HOME}/.vimrc
ln ${HOME}/.dotfiles/dots/common/zshrc                    ${HOME}/.zshrc
ln ${HOME}/.dotfiles/dots/common/bundles.vim              ${HOME}/.bundles.vim
ln ${HOME}/.dotfiles/dots/common/tmux.conf                ${HOME}/.tmux.conf

echo "Installing zgen plugin manager."
git clone https://github.com/tarjoilija/zgen.git ${HOME}/.zgen

echo "Activating new configurations to trigger zgen plugin installs."
source ${HOME}/.zshrc

echo "Installing Vundle plugins."
vim +PluginInstall +qall

echo "Building the YouCompleteMe core library."
cd ${HOME}/.vim/bundle/Vundle.vim/YouCompleteMe
python install.py
cd ${HOME}

echo "Configuring submodules."
git submodule init

echo "Creating .machinerc to hold configs specific to this system."
touch ${HOME}/.machinerc
echo ".machinerc" >> ${HOME}/.gitignore

# Look for installation of Nerd Fonts and warn if not found
if [ -d ${HOME}/Library/Fonts ]; then
    if [ $(find ${HOME}/Library/Fonts -name "*Nerd*") ]; then
        NERD_FONTS_FOUND = 1
    fi
fi

if [-d ${HOME}/.fonts ]; then
    if [ $(find ${HOME}/.fonts -name "*Nerd*") ]; then
        NERD_FONTS_FOUND = 1
    fi
fi

if [ -d /usr/share/fonts]; then
    if [ $(find /usr/share/fonts -name "*Nerd*") ]; then
        NERD_FONTS_FOUND = 1
    fi
fi

if [ ! ${NERD_FONTS_FOUND} ]; then
    echo "Nerd Fonts collection doesn't appear to be installed."
    echo "This may not be a problem if this system is running headless."
    echo "If not, they should be installed."
fi


# Look for installation of Powerline Fonts and warn if not found
if [ -d ${HOME}/Library/Fonts ]; then
    if [ $(find ${HOME}/Library/Fonts -name "*Powerline*") ]; then
        NERD_FONTS_FOUND = 1
    fi
fi

if [-d ${HOME}/.fonts ]; then
    if [ $(find ${HOME}/.fonts -name "*Powerline*") ]; then
        NERD_FONTS_FOUND = 1
    fi
fi

if [ -d /usr/share/fonts]; then
    if [ $(find /usr/share/fonts -name "*Powerline*") ]; then
        NERD_FONTS_FOUND = 1
    fi
fi

if [ ! ${NERD_FONTS_FOUND} ]; then
    echo "Powerline Fonts collection doesn't appear to be installed."
    echo "This may not be a problem if this system is running headless."
    echo "If not, they should be installed."
fi

echo "Automated installation complete."
echo ""
echo "If not already installed on your workstation(s), you should install the Nerd Fonts and Powerline Fonts collections."
