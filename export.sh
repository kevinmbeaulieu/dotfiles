#!/bin/zsh

# Note: Run with sudo, otherwise will not work properly.

cp $HOME/.gitconfig .
cp $HOME/.vimrc .
cp -r $HOME/.vim .
cp -r $ZSH_CUSTOM/plugins zsh-custom-plugins
cp $HOME/.zshrc .zshrc
