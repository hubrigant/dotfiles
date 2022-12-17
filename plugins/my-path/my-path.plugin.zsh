#!/usr/bin/env zsh

set EXTENDED_GLOB

# ensure that there are no duplicates allowed in $path_array
typeset -U path_array
typeset -U path

# add all of the possible paths
path_array=(
    /anaconda3a/bin
	${HOME}/anaconda3a/bin
	${HOME}/miniconda3a/bin
	${HOME}/miniconda3a/condabin
	${HOME}/miniconda3a/bin
	${HOME}/bin
    ${HOME}/.local/bin
	${HOME}/scripts
	${HOME}/.gem/ruby/2.7.0
	/usr/local/bin
	/usr/local/sbin
    /usr/local/opt/bison/bin
	/usr/local/opt/ruby/bin
    /usr/local/opt/texinfo/bin
	/usr/local/lib/ruby/gems/2.6.0/bin
    /usr/local/go/bin
	/opt/local/bin
	/opt/local/sbin
    /usr/local/Cellar/bison/3.7.1/bin
    /Library/TeX/texbin
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
	${HOME}/.dotfiles/scripts
)

path=(${HOME}/bin)
# remove path entries that don't exist
for dir in $path_array; do
    if [ -d $dir ]; then
        path+=$dir
    fi
done
