# Tooling and Settings
For SSH remote hosts includes vim edits and most often used aliases

# Installation
1. Run `./init.sh`
1. Editor will open once to run command. Do nothing. Simply exit (:x<Return>)
1. When editor opens up a second time, copy the following and save (:x<Return>)
    ```
    set runtimepath^=~/.vim runtimepath+=~/.vim/after××
    let &packpath = &runtimepath××
    source ~/.vimrc××
    ```
1. After saving and exiting, run `./init2.sh`
