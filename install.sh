#!/usr/bin/env bash

# Git and Curl required
if [[ $(which git) == "" ]]
then
    echo "Install git ( http://git-scm.com ) first"
    exit 1
fi
if [[ $(which curl) == "" ]]
then
    echo "Install curl ( http://curl.haxx.se ) first"
    exit 1
fi

# Download Vundle
mkdir -p ~/.vim/bundle
if [[ ! -d ~/.vim/bundle/vundle ]]
then
    git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

# Download upstart.vim
mkdir -p ~/.vim/syntax/
curl http://bazaar.launchpad.net/~upstart-devel/upstart/trunk/download/head:/upstart.vim-20090708195914-1n7k3bcwobwm4ag7-7/upstart.vim -o ~/.vim/syntax/upstart.vim

# vimrc, gvimrc
ln -s -f $PWD/vimrc ~/.vimrc
ln -s -f $PWD/gvimrc ~/.gvimrc

vim -c "BundleInstall" -c "quit"

# Command-T post-download installation
if [[ -d ~/.vim/bundle/command-t ]]
then
    cd ~/.vim/bundle/command-t
    rake make
    cd -
fi

echo "Finished"