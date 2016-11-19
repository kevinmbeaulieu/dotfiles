#!/bin/zsh

cp .gitconfig $HOME
cp .vimrc $HOME
cp .zshrc $HOME
if [ -z "$ZSH_CUSTOM" ]; then
    ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
fi
rsync -rv --exclude=.DS_Store plugins $ZSH_CUSTOM

source .macos
