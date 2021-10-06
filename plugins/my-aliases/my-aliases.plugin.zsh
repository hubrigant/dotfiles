#!/usr/bin/env zsh

# general
alias vi='nvim'
alias ahe='nvim ~/.dotfiles/config_masters/SwapEscAndCapsLock.ahk'
alias ale='nvim ~/.dotfiles/plugins/my-aliases/my-aliases.plugin.zsh'
alias alr='source ~/.dotfiles/plugins/my-aliases/my-aliases.plugin.zsh'
alias alce='nvim ~/.dotfiles/config_masters/alacritty.yml'
alias bue='nvim ~/.bundles.vim'
alias bur='env vim +PlugInstall +qall && env nvim +PlugInstall +qall'
alias tme='nvim ~/.tmux.conf'
alias tmr='tmux source-file ~/.tmux.conf'
alias cd-='cd -'
alias ine='nvim ~/.dotfiles/scripts/install_dotfiles.zsh'
alias inr='~/.dotfiles/scripts/install_dotfiles.zsh'
alias jd='j dotfile'
alias jl='jupyter-lab'
if [[ ${OSTYPE} =~ ".*arwin.*" ]]
then
	alias ls='ls -FG'
else
	alias ls='ls -FG --color'
fi
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ll -a'
alias nvie='nvim ~/.dotfiles/config_masters/nvim_init.vim'
alias p1e='nvim ~/.dotfiles/config_masters/p10k.zsh'
alias p1r='source ~/.dotfiles/config_masters/p10k.zsh'
alias p9e='nvim ~/.dotfiles/config_masters/p9k.zsh'
alias p9r='source ~/.dotfiles/config_masters/p9k.zsh'
alias pae='nvim ~/.dotfiles/plugins/my-path/my-path.plugin.zsh'
alias par='source ~/.dotfiles/plugins/my-path/my-path.plugin.zsh'
alias sai='sudo apt install'
alias saud='sudo apt update'
alias saug='sudo apt upgrade'
alias sauu='sudo apt update && sudo apt upgrade'
alias saar='sudo apt autoremove'
alias the='nvim ~/.dotfiles/config_masters/theming.zsh'
alias thr='source ~/.dotfiles/config_masters/theming.zsh'
alias top='htop'
alias tre='nvim ~/.dotfiles/config_masters/tridactyl'
alias vie='nvim ~/.dotfiles/config_masters/vimrc'
alias zre='nvim ~/.dotfiles/config_masters/zshrc'
alias zrr='source ~/.zshrc'
alias zee='nvim ~/.dotfiles/config_masters/zshenv'
alias zer='source ~/.zshenv'
alias zx='exec /usr/local/bin/zsh'
alias bi='brew install'
alias bd='brew doctor'
alias diskutil='diskUtil'
function buc(){
    rm -rf ~/.vim/bundle
    vundle-init
    /usr/local/bin/vim +PluginInstall +qall
}
function thc() {
    sed -i -e 's/^TRY_THEME=.*/TRY_THEME=${@}/g' ~/.dotfiles/config_masters/theming.zsh
}
function tma() {
    tmux list-sessions
    if [ $? -ne 0 ]; then # |grep -i detached) ]; then
        tmux new-session
    else;
        tmux attach
    fi
}

# history aliases copied from the oh-my-zsh history plugin
# added here because the other plugin isn't working
alias h='history'

function hs
{
    history | grep $*
}

alias hsi='hs -i'

# ZSH
alias speedtest='repeat 10 {time zsh -i -c exit}'
alias profon="sed -i -e 's/PROFILING:-false/PROFILING:-true/g' ~/.zshrc"
alias profoff="sed -i -e 's/PROFILING:-true/PROFILING:-false/g' ~/.zshrc"
alias profcap="zprof >~/.tmp/zprof.txt"
alias profe="vi ~/.tmp/zprof.txt"

# Programming
alias loopcmd='ag -l |entr -c'
alias testloop='ag -l --python |entr pytest'
alias jpl='cd ~/Documents/GitHub/JupyterNotebooks && jupyter-lab --no-browser'

# GitHub
alias ga='git add'
alias gca='git commit -a -m'
alias gcm='git commit -m'
alias gd='git difftool'
alias gp='git push'
alias gis='git status'
alias gpu='git pull'
export GHP='https://github.com/'
alias gcl='git clone'

# tmux
alias tm='tmux'
# alias tma='tmux attach'
alias tmd='tmux detach'

# Tmuxinator
alias txst='tmuxinator start traffic'

# gentoo
alias sem='sudo emerge --ask'
function esch() {
	emerge --search $1 |egrep -e '^\*'
}
