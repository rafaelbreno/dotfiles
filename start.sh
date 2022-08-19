#!/usr/bin/env bash

# font
if ! compgen -G "$HOME/.local/share/fonts/Victor*" > /dev/null; then
    echo ">> Installing font"
    # downloading font zip
    curl https://rubjo.github.io/victor-mono/VictorMonoAll.zip -o font.zip
    unzip font.zip -d font/

    rm -rf font.zip

    ## in case this folder doesn't exists
    mkdir ~/.local/share/fonts

    cp font/TTF/*.ttf ~/.local/share/fonts
    ## cleaning up cache
    fc-cache -f -v
else 
  echo ">> Font already installed"
fi

exit 1

# checking if yay exists
if ! command -v yay &> /dev/null; then
    echo "NOT FOUND"
    exit
else
    echo "FOUND"
fi

# bootstrap

exit 1

## Declaring packages to be installed
packages=('git' 'zsh')

## installing packages
for pkg in $packages; do 
  yay --noconfirm --answerclean y --answerdiff y -S $pkg -y
done
