#!/bin/zsh

cp .gitconfig $HOME
cp .vimrc $HOME
cp -r .vim $HOME
if [ -z "$ZSH_CUSTOM" ]; then
    ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
fi
cp -r zsh-custom-plugins $ZSH_CUSTOM/plugins
