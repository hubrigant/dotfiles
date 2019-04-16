#!/usr/bin/env zsh

if [[ ! -d ~/.tmux/plugins/tpm/.git ]]; then
    git clone git@github.com:tmux-plugins/tpm.git ~/.tmux/plugins/tpm
fi
