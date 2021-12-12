#!/bin/sh

nvim_path = $HOME/gabriel/neovim

echo "Removing old neovim..."
sudo rm /usr/local/bin/nvim
sudo rm -r /usr/local/share/nvim/
if [ -d $nvim_path ] 
then
    sudo rm -rf $nvim_path
fi

echo "Installing dependencies"
pacman --noconfirm --needed -S base-devel cmake unzip ninja tree-sitter curl >/dev/null 2>&1
echo "Cloning neovim repo..."
git clone git@github.com:neovim/neovim.git >/dev/null 2>&1

echo "Installing Neovim, this will take a while..."
cd $HOME/neovim
make CMAKE_BUILD_TYPE=Release >/dev/null 2>&1
sudo make install >/dev/null 2>&1
cd $HOME

echo "Neovim is installed"
