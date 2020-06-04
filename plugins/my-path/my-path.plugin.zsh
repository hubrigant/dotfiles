#!/usr/bin/env zsh

set EXTENDED_GLOB

# ensure that there are no duplicates allowed in $path_array
typeset -U path_array
typeset -U path

# add all of the possible paths
path_array=(
    /anaconda3/bin
	${HOME}/anaconda3/bin
	${HOME}/miniconda3/bin
	${HOME}/miniconda3/condabin
	${HOME}/miniconda3/bin
	${HOME}/bin
	${HOME}/scripts
	${HOME}/.gem/ruby/2.7.0
	/usr/local/bin
	/usr/local/sbin
	/usr/local/opt/ruby/bin
	/usr/local/lib/ruby/gems/2.6.0/bin
	/opt/local/bin
	/opt/local/sbin
	PYTHON
	/home/linuxbrew/.linuxbrew/bin
	/home/linuxbrew/.linuxbrew/lib/ruby/gems/2.7.0
	/home/linuxbrew/.linuxbrew/Cellar/ruby/2.7.0/lib/ruby/gems/2.7.0
	/bin
	/sbin
	/usr/bin
	/usr/sbin
	${HOME}/.dotfiles/scripts
	${HOME}/bin
	${HOME}/scripts
	/usr/local/bin
	/usr/local/sbin
	/usr/local/opt/ruby/bin
	/usr/local/lib/ruby/gems/2.6.0/bin
	/opt/local/bin
	/opt/local/sbin
	/bin
	/sbin
	/usr/bin
	/usr/sbin
	${HOME}/.dotfiles/scripts
)

path=(/bin)
# remove path entries that don't exist
for dir in $path_array; do
    if [ -d $dir ]; then
        path+=$dir
    fi
done
