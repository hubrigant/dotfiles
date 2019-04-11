# begin section 1
# This first section adapted from https://www.outcoldman.com/en/archive/2015/09/13/keep-your-sh-together/

# If I see that zsh takes to much time to load I profile what has been changed,
# I want to see my shell ready in not more than 1 second
PROFILING=${PROFILING:-false}
if $PROFILING; then
    zmodload zsh/zprof
fi

# Location of my dotfiles
DOTFILES=$HOME/.dotfiles

# Update PATH
path=(
    /usr/local/{bin,sbin}
    $DOTFILES/scripts
    $path
)
typeset -U path

# if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# change the size of history files
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;

# Autoenv https://github.com/Tarrasch/zsh-autoenv
# Plugin to automatically modify path when it sees .env file
AUTOENV_FILE_ENTER=.env
AUTOENV_FILE_LEAVE=.env1

# tmux plugin settings
# this always starts tmux
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOSTART_ONCE=true
ZSH_TMUX_FIXTERM=true
ZSH_TMUX_AUTOQUIT=false # not sure what this does, may remove later

# set DEFAULT_USER based on different environments
if [[ $OSTYPE =~ 'darwin' ]]; then
    if [[ `hostname` = 'WDXJW68539TD8' ]]; then
        DEFAULT_USER=jw68539
    else
        DEFAULT_USER=jon
    fi
else
    DEFAULT_USER=pi
fi

# Shell
export CLICOLOR=1
export EDITOR='vim'
export PAGER='less'

# Remove the history (fc -l) command from the history list when invoked.
setopt histnostore
# Remove superfluous blanks from each command line being added to the history list.
setopt histreduceblanks

# end section 1

# use vi bindings
bindkey -v

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/miniconda3/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation
# USERID=`whoami`
# MY_HOME_DIR=`finger $USERID |awk -F: '{print $2}' |awk '{print $1}' |head -2 |tail -1`
OH_MY_ZSH_SUFFIX="/.oh-my-zsh"
export ZSH=$HOME$OH_MY_ZSH_SUFFIX

export TERM=screen-256color

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLEVEL9K_MODE='awsome-patched'
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)
plugins=(sudo git history taskwarrior tmux tmuxinator zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# zsh tmux settings
ZSH_TMUX_AUTOSTART='true'

## Powerlevel9k Settings
POWERLEVEL9K_HISTORY_BACKGROUND='green'

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

POWERLEVEL9K_PROMPT_ON_NEWLINE=true

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%F{red} \Uf1d0 %f %F{yellow
}❯ "

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(anaconda status history ssh root_indicator)

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=false
POWERLEVEL9K_CONTEXT_ALWAYS_SHOW=true
POWERLEVEL9K_CONTEXT_ALWAYS_SHOW_USER=false

# Command prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir_joined vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status anaconda root_indicator vi_mode ssh)

# GitHub icon
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uF113'

# dir
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY='truncate_to_first_and_last'

POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=true

# anaconda segment
POWERLEVEL9K_ANACONDA_LEFT_DELIMITER="\uE235 "
POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER=""
POWERLEVEL9K_ANACONDA_BACKGROUND='cyan'
POWERLEVEL9K_ANACONDA_FOREGROUND='black'


# dumb terminal can be a vim dump terminal in that case don't try to load plugins
if [ ! $TERM = dumb ]; then
    ZGEN_AUTOLOAD_COMPINIT=true
    # If user is root it can have some issues with access to competition files
    if [[ "${USER}" == "root" ]]; then
        ZGEN_AUTOLOAD_COMPINIT=false
    fi

    # load zgen
    # source $DOTFILES/zgen/zgen.zsh
    source ${HOME}/.zgen/zgen.zsh

    # configure zgen
    if ! zgen saved; then

        # zgen will load oh-my-zsh and download it if required
        zgen oh-my-zsh

        # these plugins only have utility on my raspis
        if ! [[ $OSTYPE =~ 'darwin' ]]; then
            zgen oh-my-zsh plugins/debian
            zgen oh-my-zsh plugins/systemd
        fi

        # list of plugins from zsh I use
        # see https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
        zgen oh-my-zsh plugins/brew
        zgen oh-my-zsh plugins/docker
        zgen oh-my-zsh plugins/git
        zgen oh-my-zsh plugins/git-extras
        zgen oh-my-zsh plugins/gitignore
        zgen oh-my-zsh plugins/osx
        zgen oh-my-zsh plugins/pip
        zgen oh-my-zsh plugins/python
        zgen oh-my-zsh plugins/sudo
        zgen oh-my-zsh plugins/tmuxinator
        zgen oh-my-zsh plugins/vundle
        zgen oh-my-zsh plugins/autojump
        zgen oh-my-zsh plugins/autopep8
        zgen oh-my-zsh plugins/django
        zgen oh-my-zsh plugins/extract
        zgen oh-my-zsh plugins/gitflow
        zgen oh-my-zsh plugins/jsontools
        zgen oh-my-zsh plugins/macports
        zgen oh-my-zsh plugins/pep8
        zgen oh-my-zsh plugins/pyenv
        zgen oh-my-zsh plugins/pylint
        zgen oh-my-zsh plugins/taskwarrior
        zgen oh-my-zsh plugins/vi-mode

        # https://github.com/Tarrasch/zsh-autoenv
        zgen load Tarrasch/zsh-autoenv
        # https://github.com/zsh-users/zsh-completions
        zgen load zsh-users/zsh-completions src

        # my own plugins
        zgen load $DOTFILES/plugins/aliases
        # zgen load $DOTFILES/plugins/dotfiles
        zgen load $DOTFILES/plugins/my-brew
        zgen load $DOTFILES/plugins/tpm

        # load https://github.com/bhilburn/powerlevel9k theme for zsh
        zgen load bhilburn/powerlevel9k powerlevel9k.zsh-theme

        # It takes control, so load last
        zgen load $DOTFILES/plugins/my-tmux

        zgen save
    fi

    # Configure vundle
    vundle-init
fi

# specific for machine configuration, which I don't sync
if [ -f ~/.machinerc ]; then
    source ~/.machinerc
fi

alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias dotfiles="git --git-dir=$HOME/.dotfiles.git"
alias vi="vim"
alias txst="tmuxinator start traffic"

# added by Miniconda3 3.16.0 installer
export PATH="~/miniconda3/bin:$PATH"

# added by Anaconda3 5.0.0 installer
# export PATH="/anaconda3/bin:$PATH"  # commented out by conda initialize

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
   eval "$__conda_setup"
else
   if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
       . "/anaconda3/etc/profile.d/conda.sh"
   else
       export PATH="/anaconda3/bin:$PATH"
   fi
fi
unset __conda_setup
# <<< conda initialize <<<

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# additional configuration for zsh
# Remove the history (fc -l) command from the history list when invoked.
setopt histnostore
# Remove superfluous blanks from each command line being added to the history list.
setopt histreduceblanks
# Do not exit on end-of-file. Require the use of exit or logout instead.
# setopt ignoreeof
# Print the exit value of programs with non-zero exit status.
setopt printexitvalue
# Do not share history
setopt no_share_history

export PATH=$HOME/bin:$HOME/miniconda3/bin:/usr/local/bin:$PATH

# if profiling was on
if $PROFILING; then
    zprof
fi

# zsh-syntax-highlighting must be sourced as the last thing in this file
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
