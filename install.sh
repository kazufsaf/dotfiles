#!/bin/bash

DOT_FILES=( .emacs.d .gitconfig .Xmodmap .xmobarrc .xmonad .ctags .tmux.conf .atom .tern-config .aspell.conf)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

