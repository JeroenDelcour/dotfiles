#!/bin/bash

# set up symlinks
ln -s ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -sT ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux ~/.tmux

cd ~/dotfiles/vim/bundle/YouCompleteMe
python3 install.py

echo "Setup completed."
