#!/usr/bin/env bash

# checking if yay exists
if ! command -v yay &> /dev/null; then
    echo "NOT FOUND"
    exit
else
    echo "FOUND"
fi

# checking if git exists
if ! command -v git &> /dev/null; then
    echo ">> Installing git"
    pacman --noconfirm -Sy git
    exit
fi
