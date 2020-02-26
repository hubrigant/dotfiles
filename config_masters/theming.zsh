TRY_THEME="p10k"
if [ -n "${TRY_THEME+1}" ]; then
    if [ -f ${HOME}/.${TRY_THEME}.zsh ]; then
        echo "Using the ${TRY_THEME} theme."
        source ${HOME}/.${TRY_THEME}.zsh
    else;
        echo "TRY_THEME was set, but the RC file ${HOME}/.${TRY_THEME}.zsh doesn't exist"
    fi
else;
    echo "Couldn't use ${TRY_THEME}, so defaulting to p9k."
    source ${HOME}/.p9k.zsh
fi
