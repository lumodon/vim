#!/bin/sh
mv .gitconfig "$HOME/"
mv .gitignore_global "$HOME/"
mkdir -p "$HOME/bin"
mv diff-so-fancy "$HOME/bin/"
mv .bash_profile "$HOME/.bash_profile"
echo "source .bash_profile" >> "$HOME/.bashrc"
mv .vim "$HOME/.vim"
sudo apt install -y npm
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update -y
sudo apt-get install -y neovim
sudo apt install -y python3-pip
pip3 install neovim
nvim -c ":call mkdir(stdpath('config'), 'p') | quit"
nvim -c ":exe 'edit '.stdpath('config').'/init.vim'"

