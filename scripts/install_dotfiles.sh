#!/usr/bin/env zsh

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ ${DOTFILES_DIR}=${HOME} ]]; then
	if [[ -d ${HOME}/.dotfiles && -f ${HOME}/.dotfiles/config_masters/zshrc ]]; then
		DOTFILES_DIR=${HOME}/.dotfiles
	else
		DOTFILES_DIR=$(find ${HOME}/.* -name install_dotfiles.zsh|sed 's/\/scripts\/install_dotfiles.zsh//')
	fi
fi

if [ ! -d "${DOTFILES_DIR}" ]; then
    print -P "%B%K{red}%F{black}[X]%f%k%b Unable to find dotfiles repo locally. Please clone and try again."
    exit(1)
else
    print -P "%B%K{green}%F{black}[*]%k%f%b The dotfiles repo exists, good."
fi

if ! git_loc="$(type -p "git")" || [[ -z $git_loc ]]; then
    print -P "%B%K{red}%F{black}[X]%f%k%b A git client is required. Please install and try again."
    exit(1)
else
    print -P "%B%K{green}%F{black}[*]%f%k%b You have a git cleint. Good."
fi

if ! vim_loc="$(type -p "vim")" || [[ -z $vim_loc ]]; then
    print -P "%B%K{red}%F{black}[X]%f%k%b No vim app found. Please install and try again."
    exit(1)
else
	print -P "%B%K{green}%F{black}[*]%f%k%b You have vim. Good."
fi

if ! python_loc="$(type -p "python")" || [[ -z $python_loc ]]; then
    print -P "%B%K{red}%F{black}[X]%f%k%b No Python version found. Please install and try again."
else
	print -P "%B%K{green}%F{black}[*]%f%k%b You have python. Good,"
fi

if [[ ! $SHELL =~ 'zsh' ]]; then
    if $(chsh -s $(which zsh)); then
        print -P "%B%K{green}%F{black}[*]%f%k%b Your shell wasn't zsh, but now it is."
    else
        print -P "%B%KP{red}%F{black}[X]%f%k%b Your shell isn't zsh, and I couldn't change it."
    fi
else
    print -P "%B%K{green}%F{black}[*]%f%k%b ZSH is already my shell, continuing."
fi

if [ -v $ZSH ]; then
    print -P "%B%K{green}%F{black}[*]%f%k%b ZSH environment variable set. Unsetting to prevent incorrect oh-my-zsh installation and config."
    unset ZSH
else
	print -P "%B%K{green}%F{black}[*]%f%k%b The ZSH environment variable isn't set. Good."
fi

if ! cmake_loc="$(type -p "cmake")" || [[ -z $cmake_loc ]]; then
    print -P "%B%K{red}%F{black}[*]%f%k%b No cmake found. Please install and try again."
    exit(1)
else
	print -P "%B%K{green}%F{black}[*]%f%k%b You have cmake installed. Good."
fi

# looks like the pre-reqs are there, let's get going!

if [ ! -d ${HOME}/dotfiles.bkup ]; then
    if [[ $(mkdir ${HOME}/dotfiles.bkup) ]]; then
        print -P "%B%K{green}%F{black}[*]%f%k%b Created ${HOME}/dotfiles.bkup"
    else
        print -P "%B%K{red}%F{black}[X]%f%k%b Failed to create backup dir ${HOME}/dotfiles.bkup"
        exit(1)
    fi
fi

print -P "%B%K{green}%F{black}[*]%k%f%b Backing up old home-dir dot files before creating links"
[ -f ${HOME}/.gitconfig ]           && mv ${HOME}/.gitconfig           ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.gitignore_global ]    && mv ${HOME}/.gitignore_global    ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.tmux.conf ]           && mv ${HOME}/.tmux.conf           ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.tmux-local.conf ]     && mv ${HOME}/.tmux-local.conf     ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.vimrc ]               && mv ${HOME}/.vimrc               ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.zshrc ]               && mv ${HOME}/.zshrc               ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.bundles.vim ]         && mv ${HOME}/.bundles.vim         ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.zgen.conf ]           && mv ${HOME}/.zgen.conf           ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.global_extra_conf ]   && mv ${HOME}/global_extra_conf.py ${HOME}/dotfiles.bkup >/dev/null 2>&1

print -P "%B%K{green}%F{black}[*]%k%f%b Removing old home-dir dot files."
[ -f ${HOME}/.gitconfig ]           && rm ${HOME}/.gitconfig
[ -f ${HOME}/.gitignore_global ]    && rm ${HOME}/.gitignore_global
[ -f ${HOME}/.tmux.conf ]           && rm ${HOME}/.tmux.conf
[ -f ${HOME}/.tmux-local.conf ]     && rm ${HOME}/.tmux-local.conf
[ -f ${HOME}/.vimrc ]               && rm ${HOME}/.vimrc
[ -f ${HOME}/.zshrc ]               && rm ${HOME}/.zshrc
[ -f ${HOME}/.bundles.vim ]         && rm ${HOME}/.bundles.vim
[ -f ${HOME}/.zgen.conf ]           && rm ${HOME}/.zgen.conf
[ -f ${HOME}/global_extra_conf.py ] && rm ${HOME}/global_extra_conf.py

# link new dot files
print -P "%B%K{green}%F{black}[*]%k%f%b Creating hard links of dot files"
ln ${DOTFILES_DIR}/config_masters/gitconfig             ${HOME}/.gitconfig
ln ${DOTFILES_DIR}/config_masters/gitignore_global      ${HOME}/.gitignore_global
ln ${DOTFILES_DIR}/config_masters/vimrc                 ${HOME}/.vimrc
ln ${DOTFILES_DIR}/config_masters/zshrc                 ${HOME}/.zshrc
ln ${DOTFILES_DIR}/config_masters/bundles.vim           ${HOME}/.bundles.vim
ln ${DOTFILES_DIR}/config_masters/tmux.conf             ${HOME}/.tmux.conf
ln ${DOTFILES_DIR}/config_masters/tmux-local.conf       ${HOME}/.tmux-local.conf
ln ${DOTFILES_DIR}/config_masters/zgen                  ${HOME}/.zgen.conf
ln ${DOTFILES_DIR}/config_masters/global_extra_conf.py  ${HOME}/global_extra_conf.py

print -P "%B%K{green}%F{black}[*]%k%f%b Installing zgen plugin manager."
if [ -d ${HOME}/.zgen ]; then
    print -P "%B%K{green}%F{black}[*]%f%k%b You already have a ~/.zgen directory."
else
    if git clone https://github.com/tarjoilija/zgen.git ${HOME}/.zgen; then
        print -P "%B%K{green}%F{black}[*]%f%k%b Successfully cloned zgen."
    else
        print -P "%B%K{red}%F{black}[X]%f%k%b Couldn't clone zgen for some reason."
        exit(1)
    fi
fi

print -P "%B%K{green}%F{black}[*]%k%f%b Loading zgen configuration to trigger plugin installs"
source ${HOME}/.zgen.conf

ZGEN=${HOME}/.zgen

if [ ! -d ${ZGEN}/robbyrussell/oh-my-zsh-master/custom/themes/powerlevel9k ]; then
    print -P "%B%K{green}%F{black}[*]%k%f%b Linking the powerlevel9k theme into the oh-my-zsh plugin custom themes path."
    if [[ ( -d ${ZGEN}/bhilburn/powerlevel9k-master && -d ${ZGEN}/robbyrussell/oh-my-zsh-master/custom/themes/ ) ]]; then
        ln -s ${ZGEN}/bhilburn/powerlevel9k-master ${ZGEN}/robbyrussell/oh-my-zsh-master/custom/themes/powerlevel9k
    else
        print -P "%B%K{red}%F{black}[X]%f%k%b Oops, couldn't find the right way to link the powerlevel9k theme."
        exit(1)
    fi
fi

if [ ! -d ${ZGEN}/robbyrussell/oh-my-zsh-master/custom/plugins/zsh-auatosuggestions ]; then
    print -P "%B%K{green}%F{black}[*]%k%f%b Installing zsh-autosuggestions"
    if git clone https://github.com/zsh-users/zsh-autosuggestions ${ZGEN}/robbyrussell/oh-my-zsh-master/custom/plugins/zsh-auatosuggestions; then
        print -P "%B%K{green}%F{black}[*]%f%k%b Success!"
    else
        print -P "%B%K{red}%F{black}[X]%f%k%b Cloudn't clone zsh-autosuggestions for some reason."
        exit(1)
    fi
fi

print -P "%B%K{green}%F{black}[*]%k%f%b Activating new configurations."
source ${HOME}/.zshrc

print -P "%B%K{green}%F{black}[*]%k%f%b Installing Vundle plugins."
if /usr/local/bin/vim +PluginInstall +qall; then
    print -P "%B%K{green}%F{black}[*]%f%k%b Success!"
else
    print -P "%B%K{red}%F{black}[X]%f%k%b Install failed."
    exit(1)
fi

YCMDIR=${HOME}/.vim/bundle/YouCompleteMe/third_party/ycmd/ycmd/__pycache__
if [[ ! -d $YCMDIR ]]; then
    print -P "%B%K{green}%F{black}[*]%k%f%b Building the YouCompleteMe core library."
    if [ ! -f "YouCompleteMe/third_party/ycmd/third_party/cregex/regex_3/_regex.so" ]; then
        cd ${HOME}/.vim/bundle/YouCompleteMe
        if $(python install.py > ${HOME}/dotfiles-installer.out); then
            print -P "%B%K{green}%F{black}[*]%f%k%b Success!"
        else
            print -P "%B%K{red}%F{black}[X]%f%k%b Install failed."
            exit(1)
        fi
        cd -
    fi
else
    print -P "%B%K{green}%F{black}[*]%f%k%b YouCompleteMe core already built."
fi

if ! autojump_loc="$(type -p "autojump")" || [[ -z $autojump_loc ]]; then
    print -P "%B%K{green}%F{black}[*]%k%f%b Installing autojump"
    if [[ ${OSTYPE}=~"darwin" ]]; then
        print -P "%B%K{green}%F{black}[*]%k%f%b Using Homebrew."
        if brew install autojump; then
            print -P "%B%K{green}%F{black}[*]%f%k%b Success!"
        else
            print -P "%B%K{red}%F{black}[X]%f%k%b Brew install failed."
            exit(1)
        fi
    elif [[ ${OSTYPE}=~"linux" ]]; then
        print -P "%B%K{green}%F{black}[*]%k%f%b I'm not yet sure how to install autojump on linux."
    else
        print -P "%B%K{green}%F{black}[*]%k%f%b Couldn't figure out how to install autojump. You need to do it yourself."
    fi
fi

if [ ! -d ${HOME}/.tmux/plugins/tpm ]; then
    print -P "%B%K{green}%F{black}[*]%k%f%b Installing tmux plugin manager"
    if git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm; then
        print -P "%B%K{green}%F{black}[*]%f%k%b Success!"
    else
        print -P "%B%K{red}%F{black}[X]%f%k%b TPM install failed."
        exit(1)
    fi
fi

# Create .machinerc if it doesn't already exist
if [ ! -f ${HOME}/.machinerc ]; then
    print -P "%B%K{green}%F{black}[*]%k%f%b Creating .machinerc to hold configs specific to this system."
    touch ${HOME}/.machinerc
fi

# If not already done, add .machinerc to .gitignore
print -P "%B%K{green}%F{black}[*]%k%f%b Making sure .machinerc is in .gitignore."
if [ ! $(grep machinerc ${HOME}/.gitignore) ]; then
    print -P ".machinerc" >> ${HOME}/.gitignore
fi

print -P "%B%K{green}%F{black}[*]%k%f%b Automated installation complete."
