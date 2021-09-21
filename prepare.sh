#!/bin/bash

tools=('tmux' 'picom')

pacman=$(eval "which pacman")
tmux=$(eval "which tmux")
picom=$(eval "which picom")

golang=$(eval "go version")
nvim=$(eval "which nvim")
zsh=$(eval "which zsh")

green_color='\033[0;32m'
no_color='\033[0m'
nvim_path="/home/$USER/neovim"

neovim_cleanup() {
    echo "removing old instalation..."
    sudo rm /usr/local/bin/nvim
    sudo rm -r /usr/local/share/nvim/
}

neovim_update() {
    rm -r build/

    echo "\033[32mStarting nvim update...\033[0m"

    make CMAKE_BUILD_TYPE=Release
    sudo make install

    echo "Done with neovim..."
}

neovim_install() {
    git clone https://github.com/neovim/neovim.git
    cd $nvim_path

    echo "installing necessary dependencies..."
    sudo pacman -S base-devel cmake unzip ninja tree-sitter curl

    echo "\033[32mStarting nvim installation...\033[0m"
    make CMAKE_BUILD_TYPE=Release
    sudo make install

    echo "Done with neovim..."
}

echo "run the script using sudo, so pacman can install the dependencies..."

echo "checking if pacman exists..."
if [ "$pacman" == "" ]; then
    echo "pacman is not installed, exiting..."
    exit 1
fi

echo "pacman found, keeping on with script..."

for tool in "${tools[@]}"; do
    if [ "$tool" == "" ]; then
        echo "instaling $tool"
        sudo pacman -Syu $tool
        sleep 1
    else 
        echo "$tool is already installed..."
        sleep 1
    fi
done

if [ "$nvim" == "" ]; then
    echo "installing nvim..."
    neovim_install
    sleep 2
else
    echo "do you want to update nvim? (0 - no, 1 - yes)"
    read update

    case $update in
        0)
            echo "not updating neovim..."
            ;;
        1)
            echo "updating neovim..."

            if [ -d $nvim_path ]; then
                cd $nvim_path
                git pull
                nvim_cleanup
                nvim_update
                sleep 2
            else
                nvim_install
                sleep 2
            fi
            ;;
    esac
fi

echo "checking for golang..."

if [ $? -eq 1 ]; then
    echo "installing golang..."
    pacman -Syu go
    sleep 2
    echo "done with golang..."
else 
    echo "golang already installed..."
fi

echo "stowing dotfiles..."
for tool in "${tools[@]}"; do
    stow -D $tool
    stow $tool
done


echo -e "$green_color Done! $no_color"
