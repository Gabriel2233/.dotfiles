#!/usr/bin/env bash

Folders=('tmux' 'zsh' 'nvim' 'i3' 'picom')

for folder in "${Folders[@]}"; do
    stow -D $folder
    stow $folder
done
