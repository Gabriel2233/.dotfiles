#!/bin/sh

tools=('tmux' 'zsh' 'picom' 'local' 'zathura' 'nvim' 'alacritty' 'dunst' 'x11' 'i3') 

for tool in "${tools[@]}"
do
    printf "Stowing $tool\n"
    stow -D $tool
    stow $tool
done

printf "Done!\n"
