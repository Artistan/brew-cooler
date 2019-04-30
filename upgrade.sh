#!/bin/bash

# run as user... get configs from rc files.
# not caring if this fails at all, just need to know the env for brew
source ~/.zshrc 2> /dev/null
source ~/.bashrc 2> /dev/null

#brew tap caskroom/versions

brew cleanup
brew doctor

brew update
brew upgrade
pip install --upgrade pip setuptools

brew bundle

brew cleanup
brew doctor

brew bundle --force dump


vagrant plugin repair
vagrant plugin update
