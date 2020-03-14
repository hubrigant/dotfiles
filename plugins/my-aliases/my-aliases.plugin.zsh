#!/usr/bin/env zsh

# basic conveniences
alias vi='nvim'
alias ahe='vi ~/.dotfiles/config_masters/SwapEscAndCapsLock.ahk'
alias ale='vi ~/.dotfiles/plugins/my-aliases/my-aliases.plugin.zsh'
alias alr='source ~/.dotfiles/plugins/my-aliases/my-aliases.plugin.zsh'
alias bue='vi ~/.bundles.vim'
alias bur='env vim +PlugInstall +qall && env nvim +PlugInstall +qall'
alias cd-='cd -'
alias ine='vi ~/.dotfiles/scripts/install_dotfiles.zsh'
alias inr='~/.dotfiles/scripts/install_dotfiles.zsh'
alias jd='j dotfile'
alias jl='jupyter-lab'
alias ls='ls -FG --color'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='l -a'
alias p1e='vi ~/.dotfiles/config_masters/p10k.zsh'
alias p1r='source ~/.dotfiles/config_masters/p10k.zsh'
alias p9e='vi ~/.dotfiles/config_masters/p9k.zsh'
alias p9r='source ~/.dotfiles/config_masters/p9k.zsh'
alias pae='vi ~/.dotfiles/plugins/my-path/my-path.plugin.zsh'
alias par='source ~/.dotfiles/plugins/my-path/my-path.plugin.zsh'
alias sai='sudo apt install'
alias saud='sudo apt update'
alias saug='sudo apt upgrade'
alias sauu='sudo apt update && sudo apt upgrade'
alias the='vi ~/.dotfiles/config_masters/theming.zsh'
alias thr='source ~/.dotfiles/config_masters/theming.zsh'
alias top='htop'
alias tre='vi ~/.dotfiles/config_masters/tridactyl'
alias vie='vi ~/.dotfiles/config_masters/vimrc'
alias zre='vi ~/.dotfiles/config_masters/zshrc'
alias zrr='source ~/.zshrc'
alias zee='vi ~/.dotfiles/config_masters/zshenv'
alias zer='source ~/.zshenv'
alias zx='exec /usr/local/bin/zsh'
alias bi='brew install'
alias bd='brew doctor'
alias tms='tmux new'
function buc(){
    rm -rf ~/.vim/bundle
    vundle-init
    /usr/local/bin/vim +PluginInstall +qall
}
function thc() {
    sed -i -e 's/^TRY_THEME=.*/TRY_THEME=${@}/g' ~/.dotfiles/config_masters/theming.zsh
}

# history aliases copied from the oh-my-zsh history plugin
# added here because the other plugin isn't working
alias h='history'

function hs
{
    history | grep $*
}

alias hsi='hs -i'

# ZSH conveniences
alias speedtest='repeat 10 {time zsh -i -c exit}'
alias profon="sed -i -e 's/PROFILING:-false/PROFILING:-true/g' ~/.zshrc"
alias profoff="sed -i -e 's/PROFILING:-true/PROFILING:-false/g' ~/.zshrc"
alias profcap="zprof >~/.tmp/zprof.txt"
alias profe="vi ~/.tmp/zprof.txt"

# Programming conveniences
alias testloop='ag -l --python |entr pytest'
alias jpl='cd ~/Documents/GitHub/JupyterNotebooks && jupyter-lab --no-browser'

# GitHub conveniences
alias ga='git add'
alias gca='git commit -a -m'
alias gcm='git commit -m'
alias gd='git difftool'
alias gp='git push'
alias gs='git status'
alias gpu='git pull'
export GHP='https://github.com/'
alias gcl='git clone'

# Tmuxinator conveniences
alias txst='tmuxinator start traffic'
