#!/usr/bin/zsh

# >>> conda initialize >>>
if [[ ! $(type conda) =~ 'function' ]]; then
    function conda() {
        unset -f conda
        __conda_setup="$('/home/hubrigant/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        else
            if [ -f "/home/hubrigant/miniconda3/etc/profile.d/conda.sh" ]; then
                . "/home/hubrigant/miniconda3/etc/profile.d/conda.sh"
            else
                export PATH="/home/hubrigant/miniconda3/bin:$PATH"
            fi
        fi
        unset __conda_setup
        conda $@
    }
fi
# <<< conda initialize <<<
