#!/usr/bin/env zsh

# This takes control, so load last
# Load only when we are default user (not root) and not in ssh
if [[ ${DEFAULT_USER} == ${USER} ]] && [[ -z ${SSH_CLIENT} ]]; then
    source ${DOTFILES}/plugins/tmux/tmux.plugin.zsh
fi
