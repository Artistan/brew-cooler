#!/bin/bash

# run as user... get configs from rc files.
# not caring if this fails at all, just need to know the env for brew
source ~/.zshrc 2> /dev/null
source ~/.bashrc 2> /dev/null

if which brew >/dev/null; then
    # backup the Brewfile
    cd "$(dirname "$0")"
    brew bundle --force dump
else
    echo "brew not found"
fi
