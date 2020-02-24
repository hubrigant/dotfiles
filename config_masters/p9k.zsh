## Powerlevel9k Settings
POWERLEVEL9K_HISTORY_BACKGROUND='green'

POWERLEVEL9K_PROMPT_ON_NEWLINE=true

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%F{red} \Uf1d0 %f %F{yellow}❯ "

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=false
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=false
POWERLEVEL9K_CONTEXT_ALWAYS_SHOW_USER=false
POWERLEVEL9K_ALWAYS_SHOW_USER=false
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND=red
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=black

# Command prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vcs custom_git_repo_name newline context dir custom_direnv_active )
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status anaconda root_indicator vi_mode date ssh)

# GitHub prompt
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uF113'

get_repo_name() {
    echo -n $GITREPO
}

direnv_active() {
    if [[ -n "$DIRENV_DIFF" ]]; then
        local color='%F{blue}'
        echo -n "\uf300"
    fi
}

# Custom segment configs
POWERLEVEL9K_CUSTOM_GIT_REPO_NAME="get_repo_name"
POWERLEVEL9K_CUSTOM_DIRENV_ACTIVE="direnv_active"
POWERLEVEL9K_CUSTOM_DIRENV_ACTIVE_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_DIRENV_ACTIVE_BACKGROUND="green"

# dir
POWERLEVEL9K_HOME_ICON="\uf016"
POWERLEVEL9K_HOME_SUB_ICON="\uf07c"
POWERLEVEL9K_FOLDER_ICON="\uf07b"
POWERLEVEL9K_ETC_ICON="\uf423"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
# POWERLEVEL9K_SHORTEN_STRATEGY='truncate_to_first_and_last'
POWERLEVEL9K_SHORTEN_STRATEGY='truncate_with_package_name'
POWERLEVEL9K_DIR_PACKAGE_FILES=(package.json composer.json)
POWERLEVEL9K_DIR_SHOW_WRITABLE=true

POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_CROSS=false
POWERLEVEL9K_STATUS_OK=false

# anaconda segment
POWERLEVEL9K_ANACONDA_LEFT_DELIMITER="\uE235 "
POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER=""
POWERLEVEL9K_ANACONDA_BACKGROUND='cyan'
POWERLEVEL9K_ANACONDA_FOREGROUND='black'
# POWERLEVEL9K_PYTHON_ICON="\uf81f"

# load powerlevel9k theme
source ${DOTFILES}/themes/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_MODE='awsome-patched'
ZSH_THEME="powerlevel9k/powerlevel9k"