#!/bin/zsh

cp .gitconfig $HOME
cp .vimrc $HOME
rsync -rv --exclude=.DS_Store --exclude='.git*' .zprezto $HOME

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

source .macos
