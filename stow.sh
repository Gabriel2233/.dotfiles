#!/bin/bash

tools=('tmux' 'zsh' 'picom')

Red='\033[0;31m'          
Green='\033[0;32m'        
Blue='\033[0;34m'         
Reset='\033[0m'       

for tool in "${tools[@]}"
do
    printf "${Blue}===>${Reset} Stowing $tool\n"
    stow -D $tool
    stow $tool
done

printf "${Green}===>${Reset} Done!\n"
