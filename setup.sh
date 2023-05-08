#!/bin/bash

BASEDIR=$(dirname $(realpath -s $0))

# set up symlinks
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -sT ${BASEDIR}/vim ~/.vim
ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf
ln -s ${BASEDIR}/tmux ~/.tmux
ln -s ${BASEDIR}/emacs.d ~/.emacs.d

# install zsh and oh-my-zsh
sudo apt install zsh curl tmux -y
chsh -s `which zsh` # set zsh as default shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # install oh-my-zsh
rm -v ~/.zshrc
ln -vs "${BASEDIR}/zshrc" ~/.zshrc

# setup powerline
sudo apt install powerline fonts-powerline -y

# install pyenv
curl https://pyenv.run | bash

echo "Setup completed."
