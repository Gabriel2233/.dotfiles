#!/usr/bin/env bash

Folders=('tmux' 'zsh' 'nvim' 'i3' 'picom')

for folder in "${Folders[@]}"; do
    echo "Removing $folder"
    stow -D $folder
done


