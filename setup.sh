#!/bin/zsh

git submodule update --init --recursive

brew install \
    git \
    googler \
    hub \
    m-cli \
    thefuck \
    trash \
    wget

brew tap homebrew/command-not-found

brew tap caskroom/cask
brew cask install \
    android-studio \
    atom \
    avast-mac-security \
    betterzipql \
    cdock \
    disk-inventory-x \
    displaperture \
    firefox \
    google-chrome \
    google-drive \
    iterm2 \
    keepingyouawake \
    pixelstick \
    polymail \
    purevpn \
    qlcolorcode \
    qlimagesize \
    qlstephen \
    qlvideo \
    rocket \
    slack \
    texshop \
    virtualbox

cp .gitconfig $HOME
cp .vimrc $HOME
cp .hyper.js $HOME
rsync -rv --exclude=.DS_Store --exclude='.git*' .zprezto $HOME

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done


sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

source .macos
sudo sh .safari
