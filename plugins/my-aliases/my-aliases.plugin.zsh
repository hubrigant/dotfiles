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

alias speedtest='repeat 10 {test zsh -i -c exit}'

alias testloop='ag -l --python |entr pytest'

alias commit-all='git commit -a -m'

alias alias-reload='source ~/.dotfiles/plugins/my-aliases/my-aliases.plugin.zsh'
