#!/bin/zsh

cp .gitconfig $HOME
cp .vimrc $HOME
if [ -z "$ZSH_CUSTOM" ]; then
    ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
fi
cp -R plugins $ZSH_CUSTOM/plugins

source .macos
