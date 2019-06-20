#!/usr/bin/env zsh

# basic conveniences
alias ale='vi ~/.dotfiles/plugins/my-aliases/my-aliases.plugin.zsh'
alias alr='source ~/.dotfiles/plugins/my-aliases/my-aliases.plugin.zsh'
alias bue='vi ~/.bundles.vim'
alias bur='/usr/local/bin/vim +PluginInstall +qall'
alias cd-='cd -'
alias ine='vi ~/.dotfiles/scripts/install_dotfiles.sh'
alias inr='~/.dotfiles/scripts/install_dotfiles.sh'
alias jd='j d'
alias jl='jupyter-lab'
alias ls='ls -FG'
alias top='htop'
alias vi='vim'
alias vie='vi ~/.dotfiles/config_masters/vimrc'
alias zre='vi ~/.dotfiles/config_masters/zshrc'
alias zrr='source ~/.zshrc'
alias zee='vi ~/.dotfiles/config_masters/zshenv'
alias zer='source ~/.zshenv'

function buc(){
    rm -rf ~/.vim/bundle
    vundle-init
    /usr/local/bin/vim +PluginInstall +qall
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
alias speedtest='repeat 10 {test zsh -i -c exit}'

# Programming conveniences
alias testloop='ag -l --python |entr pytest'

# GitHub conveniences
alias all-commit='git commit -a -m'
alias ga='git add'
alias gca='git commit -a -m'
alias gcm='git commit -m'
alias gd='git difftool'
alias gp='git push'
alias gs='git status'
alias gpu='git pull'

# Tmuxinator conveniences
alias txst='tmuxinator start traffic'
