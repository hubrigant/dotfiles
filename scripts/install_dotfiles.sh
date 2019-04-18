#!/usr/bin/env zsh

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ ${DOTFILES_DIR}=${HOME} ]]; then
	echo "Getting DOTFILES_DIR from execution path didn't work."
	if [[ -d ${HOME}/.dotfiles && -f ${HOME}/.dotfiles/config_masters/zshrc ]]; then
		echo "Looks like you cloned repo into standard location, so I'll use that."
		DOTFILES_DIR=${HOME}/.dotfiles
	else
		echo "You didn't clone the repo to the standard location. Searching for it."
		echo "This may take a moment."
		DOTFILES_DIR=$(find ${HOME}/.* -name install_dotfiles.zsh|sed 's/\/scripts\/install_dotfiles.zsh//')
	fi
fi
echo "I think the repo is in ${DOTFILES_DIR}."

if [ ! -d "${DOTFILES_DIR}" ]; then
    echo "The dotfiles repo has not been cloned. Please do so now and try again."
    exit(1)
else
    echo "The dotfiles repo exists, good."
fi

if [ ! $(which git) ]; then
    echo "A git client is required. Please install and try again."
    exit(1)
else
    echo "You have a git cleint. Good."
fi

if [ ! $(which vim) ]; then
    echo "Much of these configurations deal with vim, which doesn't appear to be installed,"
    echo ""
    echo "Please install it and try again."
    exit(1)
else
	echo "You have vim. Good."
fi

if [ ! $(which python) ]; then
    echo "Python is needed for some plugins and functionality."
    echo ""
    echo "Please install it and try again."
else
	echo "You have python. Good,"
fi

if [[ ! $(grep zsh ${SHELL}) ]]; then
    chsh -s $(which zsh)
else
    echo "ZSH is already my shell, continuing."
fi

if [ -v $ZSH ]; then
    echo "ZSH environment variable set. Unsetting to prevent incorrect oh-my-zsh installation and config."
    unset ZSH
else
	echo "The ZSH environment variable isn't set. Good."
fi

if [ ! $(which cmake) ]; then
    echo "No cmake found. Please install and try again."
    exit(1)
else
	echo "You have cmake installed. Good."
fi

# looks like the pre-reqs are there, let's get going!

if [ ! -d ${HOME}/dotfiles.bkup ]; then
    mkdir ${HOME}/dotfiles.bkup
fi

echo "Backing up old home-dir dot files before creating links"
if [ $(diff ${HOME}/dotfiles.bkup/.zshrc ${HOME}/.zshrc) ]; then
    mv ${HOME}/.gitconfig           ${HOME}/dotfiles.bkup
    mv ${HOME}/.gitignore_global    ${HOME}/dotfiles.bkup
    mv ${HOME}/.tmux.conf           ${HOME}/dotfiles.bkup
    mv ${HOME}/.tmux-local.conf     ${HOME}/dotfiles.bkup
    mv ${HOME}/.vimrc               ${HOME}/dotfiles.bkup
    mv ${HOME}/.zshrc               ${HOME}/dotfiles.bkup
    mv ${HOME}/.bundles.vim         ${HOME}/dotfiles.bkup
    mv ${HOME}/.zgen.conf           ${HOME}/dotfiles.bkup
    mv ${HOME}/global_extra_conf.py ${HOME}/dotfiles.bkup
fi

echo "Removing old home-dir dot files."
if [ -f ${HOME}/.zshrc ]; then
    rm ${HOME}/.gitconfig
    rm ${HOME}/.gitignore_global
    rm ${HOME}/.tmux.conf
    rm ${HOME}/.tmux-local.conf
    rm ${HOME}/.vimrc
    rm ${HOME}/.zshrc
    rm ${HOME}/.bundles.vim
    rm ${HOME}/.zgen.conf
    rm ${HOME}/global_extra_conf.py
fi

# link new dot files
echo "Creating hard links of dot files"
ln ${DOTFILES_DIR}/config_masters/gitconfig             ${HOME}/.gitconfig
ln ${DOTFILES_DIR}/config_masters/gitignore_global      ${HOME}/.gitignore_global
ln ${DOTFILES_DIR}/config_masters/vimrc                 ${HOME}/.vimrc
ln ${DOTFILES_DIR}/config_masters/zshrc                 ${HOME}/.zshrc
ln ${DOTFILES_DIR}/config_masters/bundles.vim           ${HOME}/.bundles.vim
ln ${DOTFILES_DIR}/config_masters/tmux.conf             ${HOME}/.tmux.conf
ln ${DOTFILES_DIR}/config_masters/tmux-local.conf       ${HOME}/.tmux.conf
ln ${DOTFILES_DIR}/config_masters/zgen                  ${HOME}/.zgen.conf
ln ${DOTFILES_DIR}/config_masters/global_extra_conf.py  ${HOME}/global_extra_conf.py

echo "Installing zgen plugin manager."
if [ -d ${HOME}/.zgen ]; then
    echo "You already have a ~/.zgen directory."
else
    git clone https://github.com/tarjoilija/zgen.git ${HOME}/.zgen
fi

echo "Loading zgen configuration to trigger plugin installs"
source ${HOME}/.zgen.conf

ZGEN=${HOME}/.zgen

echo "Linking the powerlevel9k theme into the oh-my-zsh plugin custom themes path."
if [[ ( -d ${ZGEN}/bhilburn/powerlevel9k-master && -d ${ZGEN}/robbyrussell/oh-my-zsh-master/custom/themes/ ) ]]; then
    ln -s ${ZGEN}/bhilburn/powerlevel9k-master ${ZGEN}/robbyrussell/oh-my-zsh-master/custom/themes/powerlevel9k
else
    echo "Oops, couldn't find the right way to link the powerlevel9k theme."
    exit(1)
fi

echo "Installing zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZGEN}/robbyrussell/oh-my-zsh-master/custom/plugins/zsh-auatosuggestions

echo "Activating new configurations."
source ${HOME}/.zshrc

echo "Installing Vundle plugins."
vim +PluginInstall +qall

echo "Building the YouCompleteMe core library."
if [ ! -f "YouCompleteMe/third_party/ycmd/third_party/cregex/regex_3/_regex.so" ]; then
    cd ${HOME}/.vim/bundle/YouCompleteMe
    python install.py
    cd -
fi

echo "Installing autojump"
if [[ ${OSTYPE}=~"darwin" ]]; then
    brew install autojump
elif [[ ${OSTYPE}=~"linux" ]]; then
    echo "I'm not yet sure how to install autojump on linux."
else
    echo "Couldn't figure out how to install autojump. You need to do it yourself."
fi

echo "Installing tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm

# echo "Configuring submodules."
# git submodule init

# Create .machinerc if it doesn't already exist
if [ ! -f ${HOME}/.machinerc ]; then
    echo "Creating .machinerc to hold configs specific to this system."
    touch ${HOME}/.machinerc
fi

# If not already done, add .machinerc to .gitignore
echo "Making sure .machinerc is in .gitignore."
if [ ! $(grep machinerc ${HOME}/.gitignore) ]; then
    echo ".machinerc" >> ${HOME}/.gitignore
fi

echo "Automated installation complete."
