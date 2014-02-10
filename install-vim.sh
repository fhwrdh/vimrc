#!/bin/sh

ln -s ~/.vim/vimrc ~/.vimrc
# install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall

