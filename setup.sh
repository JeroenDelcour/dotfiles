#!/bin/bash

BASEDIR=$(dirname $0)

# set up symlinks
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -sT ${BASEDIR}/vim ~/.vim
ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf
ln -s ${BASEDIR}/tmux ~/.tmux

# install zsh and oh-my-zsh
apt install zsh -y
chsh -s `which zsh` # set zsh as default shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # install oh-my-zsh
rm -v ~/.zshrc && ln -vs "${BASEDIR}/zshrc" ~/.zshrc

# setup powerline
apt install powerline fonts-powerline -y

# setup virtualenvwrapper
pip3 install virtualenvwrapper

echo "Setup completed."
