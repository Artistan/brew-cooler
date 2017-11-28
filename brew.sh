#!/bin/bash

cd "$(dirname "$0")"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# this will install bundle and then use the Brewfile to install all the rest
brew bundle


