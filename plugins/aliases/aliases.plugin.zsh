#!/usr/bin/env zsh

alias vi="vim"
alias txst="tmuxinator start traffic"
alias jd='j d'
alias ls='ls -FG'

# history aliases copied from the oh-my-zsh history plugin
# added here because the other plugin isn't working
alias h='history'

function hs
{
    history | grep $*
}

alias hsi='hs -i'
