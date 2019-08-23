#!/bin/sh
nvim -c ":PlugInstall"
nvim -c ":PlugClean"
nvim -c ":PlugInstall"
echo "alias vim=\"nvim\"" >> .bash-profile

