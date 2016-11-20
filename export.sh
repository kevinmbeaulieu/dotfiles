#!/bin/zsh

cp $HOME/.gitconfig .
cp $HOME/.vimrc .
rsync -rv --exclude=.DS_Store --exclude='.git*' $HOME/.zprezto .
