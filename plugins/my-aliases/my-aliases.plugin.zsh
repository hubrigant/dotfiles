#!/usr/bin/env zsh

# basic conveniences
alias vi="vim"
alias txst="tmuxinator start traffic"
alias jd='j d'
alias ls='ls -FG'
alias cd-='cd -'
alias alias-reload='source ~/.dotfiles/plugins/my-aliases/my-aliases.plugin.zsh'

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
alias gs='git status'
alias gp='git push'
alias ga='git add'
