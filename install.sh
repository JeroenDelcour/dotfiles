#!/bin/sh

# set up symlinks
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -sT ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

echo "Installation finished."
