#!/bin/zsh

cp $HOME/.gitconfig .
cp $HOME/.vimrc .
cp $HOME/.hyper.js .
rsync -rv --exclude=.DS_Store --exclude='.git*' $HOME/.zprezto .
