#!/bin/zsh

# Note: Run with sudo, otherwise will not work properly.

cp $HOME/.gitconfig .
cp $HOME/.vimrc .
cp -R $HOME/.vim .
if [[ -z "$ZSH_CUSTOM" ]]; then
    ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
fi
if [ ! -d "zsh-custom-plugins" ]; then
    mkdir zsh-custom-plugins
fi
cp -R $ZSH_CUSTOM/plugins zsh-custom-plugins
cp $HOME/.zshrc .zshrc
