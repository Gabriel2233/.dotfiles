#!/bin/bash

tools=('tmux' 'zsh' 'picom')

Red='\033[0;31m'          
Green='\033[0;32m'        
Blue='\033[0;34m'         
Reset='\033[0m'       

install_tool() {
    printf "${Blue}===>${Reset} Do you want to install $1? (0 - no, 1 - yes): \n"
    read should_install

    if [ $should_install -eq 0 ]; then
        printf "${Red}===>${Reset} Skipping $1\n"
    elif [ $should_install -eq 1 ]; then
        printf "${Green}===>${Reset} Installing $1\n"
        eval $2
    else
        printf "${Red}Not a valid number!${Reset}\n"
        exit 1
    fi
}

install_neovim() {
    cd "/home/gabriel"
    printf "${Blue}===>${Reset} Cloning neovim\n"
    git clone --quiet https://github.com/neovim/neovim.git
    cd neovim

    printf "${Blue}===>${Reset} Installing dependencies neovim\n"
    sudo pacman -S --noconfirm --quiet --needed base-devel cmake unzip ninja tree-sitter curl

    printf "${Blue}===>${Reset} Bulding neovim, this will take a while :)\n"
    make CMAKE_BUILD_TYPE=Release
    sudo make install

    cd "/home/gabriel/.dotfiles"
    printf "${Green}===>${Reset} Done!\n"
}

install_go() {
    cd "/home/gabriel"
    printf "${Blue}===>${Reset} Installing Go\n"
    sudo pacman -S --noconfirm --quiet --needed go

    printf "${Blue}===>${Reset} Creating dirs\n"
    mkdir -p "/home/gabriel/go"
    cd "/home/gabriel/go"
    mkdir "pkg"
    mkdir "bin"
    mkdir -p "/src/github.com/Gabriel2233"

    printf "${Blue}===>${Reset} Installinf gopls\n"
    go install golang.org/x/tools/gopls@latest 

    cd "/home/gabriel/.dotfiles"

    printf "${Green}===>${Reset} Done!\n"
}

for tool in "${tools[@]}"
do
    install_tool $tool "sudo pacman -S --noconfirm --needed --quiet $tool"
done

install_neovim
install_go
