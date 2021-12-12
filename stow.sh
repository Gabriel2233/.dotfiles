#!/bin/sh

tools=('tmux' 'zsh' 'picom' 'bin')

for tool in "${tools[@]}"
do
    printf "Stowing $tool\n"
    stow -D $tool
    stow $tool
done

printf "Done!\n"
