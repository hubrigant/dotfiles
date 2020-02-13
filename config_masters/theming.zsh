TRY_THEME=p10k
if [ -n "${TRY_THEME+1}" ]; then
    if [ -f ${HOME}/.${TRY_THEME}.zsh ]; then
        source ${HOME}/.${TRY_THEME}.zsh
    else;
        echo "TRY_THEME was set, but the RC file ${HOME}/.${TRY_THEME}.zsh doesn't exist"
    fi
else;
    source ${HOME}/.p9k.zsh
fi
