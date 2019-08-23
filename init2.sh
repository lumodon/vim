#!/bin/sh
nvim -c ":PlugInstall | :PlugClean | :PlugInstall | quit"
echo "alias vim=\"nvim\"" >> .bash-profile

