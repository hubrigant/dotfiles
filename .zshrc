# use vi bindings
bindkey -v

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/miniconda3/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/pi/.oh-my-zsh"

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

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

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
--
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

source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias dotfiles="git --git-dir=$HOME/.dotfiles.git"
alias vi="vim"
alias txst="tmuxinator start traffic"

# added by Miniconda3 3.16.0 installer
export PATH="~/miniconda3/bin:$PATH"
