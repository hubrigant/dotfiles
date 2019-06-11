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

CONFIG_MASTERS_DIR="${DOTFILES_DIR}/config_masters"

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
[ -f ${HOME}/.bundles.vim ]                     && mv ${HOME}/.bundles.vim                     ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.gitconfig ]                       && mv ${HOME}/.gitconfig                       ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.gitignore_global ]                && mv ${HOME}/.gitignore_global                ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.global_extra_conf ]               && mv ${HOME}/global_extra_conf.py             ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.tmux.conf ]                       && mv ${HOME}/.tmux.conf                       ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.vimrc ]                           && mv ${HOME}/.vimrc                           ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.zshenv ]                          && mv ${HOME}/.zshenv                          ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.zshrc ]                           && mv ${HOME}/.zshrc                           ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.tridactyl ]                       && mv ${HOME}/.tridactyl                       ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.config/karabiner/karabiner.json ] && mv ${HOME}/.config/karabiner/karabiner.json ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.config/tmuxinator/dev.yml ]       && mv ${HOME}/.config/tmuxinator/dev.yml       ${HOME}/dotfiles.bkup >/dev/null 2>&1
[ -f ${HOME}/.config/tmuxinator/template.erb ]  && mv ${HOME}/.config/tmuxinator/template.erb  ${HOME}/dotfiles.bkup >/dev/null 2>&1

print -P "%B%K{green}%F{black}[*]%k%f%b Removing old home-dir dot files."
[ -f ${HOME}/.bundles.vim ]                     && rm ${HOME}/.bundles.vim
[ -f ${HOME}/.gitconfig ]                       && rm ${HOME}/.gitconfig
[ -f ${HOME}/.gitignore_global ]                && rm ${HOME}/.gitignore_global
[ -f ${HOME}/global_extra_conf.py ]             && rm ${HOME}/global_extra_conf.py
[ -f ${HOME}/.tmux.conf ]                       && rm ${HOME}/.tmux.conf
[ -f ${HOME}/.vimrc ]                           && rm ${HOME}/.vimrc
[ -f ${HOME}/.zshenv ]                          && rm ${HOME}/.zshenv
[ -f ${HOME}/.zshrc ]                           && rm ${HOME}/.zshrc
[ -f ${HOME}/.tridactyl ]                       && rm ${HOME}/.tridactyl
[ -f ${HOME}/.config/karabiner/karabiner.json ] && rm ${HOME}/.config/karabiner/karabiner.json
[ -f ${HOME}/.config/tmuxinator/dev.yml ]       && rm ${HOME}/.config/tmuxinator/dev.yml
[ -f ${HOME}/.config/tmuxinator/template.erb ]  && rm ${HOME}/.config/tmuxinator/template.erb

# link new dot files
print -P "%B%K{green}%F{black}[*]%k%f%b Creating hard links of dot files"
ln ${CONFIG_MASTERS_DIR}/bundles.vim          ${HOME}/.bundles.vim
ln ${CONFIG_MASTERS_DIR}/gitconfig            ${HOME}/.gitconfig
ln ${CONFIG_MASTERS_DIR}/gitignore_global     ${HOME}/.gitignore_global
ln ${CONFIG_MASTERS_DIR}/global_extra_conf.py ${HOME}/global_extra_conf.py
ln ${CONFIG_MASTERS_DIR}/tmux.conf            ${HOME}/.tmux.conf
ln ${CONFIG_MASTERS_DIR}/vimrc                ${HOME}/.vimrc
ln ${CONFIG_MASTERS_DIR}/zshenv               ${HOME}/.zshenv
ln ${CONFIG_MASTERS_DIR}/zshrc                ${HOME}/.zshrc
ln ${CONFIG_MASTERS_DIR}/tridactyl            ${HOME}/.tridactyl
ln ${CONFIG_MASTERS_DIR}/karabiner.json       ${HOME}/.config/karabiner/karabiner.json
ln ${CONFIG_MASTERS_DIR}/dev.yml              ${HOME}/.config/tmuxinator/dev.yml
ln ${CONFIG_MASTERS_DIR}/template.erb         ${HOME}/.config/tmuxinator/template.erb

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
