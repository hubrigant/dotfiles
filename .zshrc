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

# zsh-syntax-highlighting must be sourced as the last thing in this file
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
