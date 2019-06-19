#!/usr/bin/env zsh

# basic conveniences
alias vi='vim'
alias jd='j d'
alias ls='ls -FG'
alias cd-='cd -'
alias alias-reload='source ~/.dotfiles/plugins/my-aliases/my-aliases.plugin.zsh'
alias alias-edit='vi ~/.dotfiles/plugins/my-aliases/my-aliases.plugin.zsh'
alias ale='vi ~/.dotfiles/plugins/my-aliases/my-aliases.plugin.zsh'
alias alr='source ~/.dotfiles/plugins/my-aliases/my-aliases.plugin.zsh'
alias bue='vi ~/.bundles.vim'
alias bur='/usr/local/bin/vim +PluginInstall +qall'
alias buc='/usr/local/bin/vim +PluginClean +qall'
alias reinstall='~/.dotfiles/scripts/install_dotfiles.sh'
alias install-edit='vi ~/.dotfiles/scripts/install_dotfiles.sh'
alias ine='vi ~/.dotfiles/scripts/install_dotfiles.sh'
alias inr='~/.dotfiles/scripts/install_dotfiles.sh'
alias jl='jupyter-lab'
alias top='htop'

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
alias gd='git diff'
alias gp='git push'
alias gs='git status'
alias gpu='git pull'

# Tmuxinator conveniences
alias txst='tmuxinator start traffic'
