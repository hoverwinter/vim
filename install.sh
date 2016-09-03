#!/bin/bash

BASEDIR=$PWD
DATE=`date +%Y%m%d%H%M%S`

install_vundle() {
    git clone https://github.com/gmarik/vundle bundle/vundle
}

config_vim() {
    for item in $HOME/.vimrc $HOME/.vim.bundles $HOME/.vim
    do
        [ -L $item ] && unlink $item
    done

    for item in $HOME/.vimrc $HOME/.vim.bundles $HOME/.vim
    do
        [ -e $item ] && mv $item $item.$DATE
    done

    install_vundle

    ln -s $BASEDIR/vimrc $HOME/.vimrc
    ln -s $BASEDIR/vimrc.bundles $HOME/.vimrc.bundles
    ln -s $BASEDIR $HOME/.vim

    vim +PluginInstall +qall
}

config_vim

