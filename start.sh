#!/usr/bin/env bash

./scripts/base.sh
./scripts/font.sh

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
