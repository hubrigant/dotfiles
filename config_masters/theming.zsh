TRY_THEME=p10k
if [ -n "${TRY_THEME+1}" ]; then
    echo "I want to try ${TRY_THEME}"
    if [ -f ${HOME}/.${TRY_THEME}.zsh ]; then
        echo "Trying ${TRY_THEME}"
        source ${HOME}/.${TRY_THEME}.zsh
    else;
        echo "TRY_THEME was set, but the RC file ${HOME}/.${TRY_THEME}.zsh doesn't exist"
    fi
else;
    echo "I don't want to try a different theme, I got ${TRY_THEME} as my variable"
    source ${HOME}/.p9k.zsh
fi
