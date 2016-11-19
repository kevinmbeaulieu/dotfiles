#!/bin/zsh

# Note: Run with sudo, otherwise will not work properly.

cp $HOME/.gitconfig .
cp $HOME/.vimrc .
if [[ -z "$ZSH_CUSTOM" ]]; then
    ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
fi
rsync -rv --exclude=.DS_Store $ZSH_CUSTOM/plugins .
cp $HOME/.zshrc .
