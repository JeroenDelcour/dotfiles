#!/bin/bash

BASEDIR=$(dirname $0)

# set up symlinks
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -sT ${BASEDIR}/vim ~/.vim
ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf
ln -s ${BASEDIR}/tmux ~/.tmux
ln -s ${BASEDIR}/zshrc ~/.zshrc
ln -s ${BASEDIR}/oh-my-zsh ~/.oh-my-zsh

# install zsh and oh-my-zsh
apt install zsh
chsh -s `which zsh` # set zsh as default shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # install oh-my-zsh

# setup powerline
apt install powerline fonts-powerline

# setup virtualenvwrapper
pip3 install virtualenvwrapper -y
# stuff to show activate env in zsh
cp virtualenvs/postactivate ~/.virtualenvs/postactivate
cp virtualenvs/postdeactivate ~/.virtualenvs/postdeactivate

echo "Setup completed."
