# Customizations

* Karabiner
    * Swapped escape and caps-lock keys (karabiner.json)
    * Mapped right-shift to send <CTRL>-a, the configured tmux prefix (karabiner.json)
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
  * commit-all: 'git commit -a -m', which I used to bundle all pending changes into one GitHub commit
  * reload-aliases: source the my-aliases plugin
