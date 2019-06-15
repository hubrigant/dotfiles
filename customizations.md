# Customizations

* Karabiner
    * Swapped escape and caps-lock keys (karabiner.json)
    * Mapped right-shift to send <CTRL>-a, the configured tmux prefix (karabiner.json)
    * Configured a double-tap of the left_shift to send the tmux sequence ```<CTRL>-a q``` to select pane to switch focus
    * Swapped the command (alt) and option (Windows) keys to keep a standard experience regardless of whether I'm using a PC or a Mac keyboard
* Vim
    * Mapped the comma key to be used as Vim's <leader> keystroke (vimrc)
* tmux
    * Changed the tmux keys to split panes vertically and horizontally to \ and -, respectively
    * Changed pane numbering to start with 1 instead of the default 0
    * Changed the tmux key for reloading tmux.conf from R to r
    * Script resize-adaptable.sh and bindings of m and M to dynamically resize panes to 60/40 split horizontal and vertical, respectively
    * Bound <prefix><CTRL>-s to toggle pane synchronization and set a display indicator for whether synchronization is enabled or not
    * TPM-managed plugins
        * TPM itself
        * tmux-tasks
        * tmux-current-pane-hostname
        * vim-tmux-navigator
        * tmux-sensible
        * tmux-copycat
        * tmux-yank
* Aliases
  * basic conveniences
    * alias vi='vim'
    * alias jd='j d'
    * alias ls='ls -FG'
    * alias cd-='cd -'
    * alias alias-reload='source ~/.dotfiles/plugins/my-aliases/my-aliases.plugin.zsh'
    * alias alias-edit='vi ~/.dotfiles/plugins/my-aliases/my-aliases.plugin.zsh'
    * alias ale='vi ~/.dotfiles/plugins/my-aliases/my-aliases.plugin.zsh'
    * alias alr='source ~/.dotfiles/plugins/my-aliases/my-aliases.plugin.zsh'
    * alias reinstall='~/.dotfiles/scripts/install_dotfiles.sh'
    * alias install-edit='vi ~/.dotfiles/scripts/install_dotfiles.sh'
    * alias ine='vi ~/.dotfiles/scripts/install_dotfiles.sh'
    * alias inr='~/.dotfiles/scripts/install_dotfiles.sh'
    * alias jl='jupyter-lab'

  * history aliases copied from the oh-my-zsh history plugin, added here because the other plugin isn't working
    * alias h='history'
    * function hs
    * alias hsi='hs -i'
  * ZSH conveniences
    * alias speedtest='repeat 10 {test zsh -i -c exit}'
  * Programming conveniences
    * alias testloop='ag -l --python |entr pytest'
  * GitHub conveniences
    * alias all-commit='git commit -a -m'
    * alias ga='git add'
    * alias gca='git commit -a -m'
    * alias gcm='git commit -m'
    * alias gd='git diff'
    * alias gp='git push'
    * alias gs='git status'
    * alias gpu='git pull'
  * Tmuxinator conveniences
    * alias txst='tmuxinator start traffic'
