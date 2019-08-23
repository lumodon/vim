#!/bin/sh
nvim -c ":PlugInstall | :PlugClean | :PlugInstall | quit"
echo "alias vim=\"nvim\"" >> "$HOME/.bash_profile"
source "$HOME/.bash_profile"
