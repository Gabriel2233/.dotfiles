#!/bin/sh

nvim_path = $HOME/gabriel/neovim

echo "Removing old neovim..."
if [ -z $(which nvim) ]
then
    sudo rm /usr/local/bin/nvim
    sudo rm -r /usr/local/share/nvim/
fi
if [ -d $nvim_path ] 
then
    sudo rm -rf $nvim_path
fi

echo "Installing dependencies"
sudo pacman --noconfirm --needed -S base-devel cmake unzip ninja tree-sitter curl
echo "Cloning neovim repo..."
git clone git@github.com:neovim/neovim.git

echo "Installing Neovim, this will take a while..."
cd $HOME/neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
cd $HOME

echo "Neovim is installed"
