#!/bin/sh
cp .gitconfig "$HOME/"
cp .gitignore_global "$HOME/"
mkdir -p "$HOME/bin"
cp diff-so-fancy "$HOME/bin/"
cp .bash_profile "$HOME/.bash_profile"
echo "source \"$HOME/.bash_profile\"" >> "$HOME/.bashrc"
cp -r .vim "$HOME/.vim"
rm "$HOME/.vimrc"
sudo ln -s "$HOME/.vim/.vimrc" "$HOME/.vimrc"
sudo apt install -y npm
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update -y
sudo apt-get install -y neovim
sudo apt install -y python3-pip
pip3 install neovim
nvim -c ":call mkdir(stdpath('config'), 'p') | quit"
nvim -c ":exe 'edit '.stdpath('config').'/init.vim'"

