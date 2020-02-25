#!/usr/bin/env zsh

# ensure that there are no duplicates allowed in $path
typeset -U path

# add all of the possible paths
path=(/home/linuxbrew/.linuxbrew/bin)
path+=PYTHON
path+=/anaconda3/bin
path+=/home/hubrigant/miniconda3/bin
path+=/home/hubrigant/miniconda3/condabin
path+=/home/hubrigant/miniconda3/bin
path+=/home/hubrigant/bin
path+=/home/hubrigant/scripts
path+=/home/linuxbrew/.linuxbrew/lib/ruby/gems/2.7.0
path+=/home/hubrigant/.gem/ruby/2.7.0
path+=/home/linuxbrew/.linuxbrew/Cellar/ruby/2.7.0/lib/ruby/gems/2.7.0
path+=/usr/local/bin
path+=/usr/local/sbin
path+=/usr/local/opt/ruby/bin
path+=/usr/local/lib/ruby/gems/2.6.0/bin
path+=/opt/local/bin
path+=/opt/local/sbin
path+=/bin
path+=/sbin
path+=/usr/bin
path+=/usr/sbin
path+=/home/hubrigant/.dotfiles/scripts
path+=/home/hubrigant/bin
path+=/home/hubrigant/scripts
path+=/usr/local/bin
path+=/usr/local/sbin
path+=/usr/local/opt/ruby/bin
path+=/usr/local/lib/ruby/gems/2.6.0/bin
path+=/opt/local/bin
path+=/opt/local/sbin
path+=/bin
path+=/sbin
path+=/usr/bin
path+=/usr/sbin
path+=/home/hubrigant/.dotfiles/scripts


# remove path entries that don't exist
path=($^path(N))
