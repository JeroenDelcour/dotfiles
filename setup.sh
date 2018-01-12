#!/bin/bash

# set up symlinks
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -sT ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux ~/.tmux

echo "Installation finished."
