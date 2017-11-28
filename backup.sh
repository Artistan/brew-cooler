#!/bin/bash

# backup the Brewfile
cd "$(dirname "$0")"

brew bundle --force dump

