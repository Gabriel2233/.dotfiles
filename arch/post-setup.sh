#!/bin/sh

echo "Updating mirrors..."
sudo timedatectl set-ntp true
sudo hwclock --systohc
sudo reflector -c Brazil -a 12 --sort rate --save /etc/pacman.d/mirrorlist

echo "Installing packages..."
sudo pacman -Syyu --needed xorg-server xorg-xbacklight xorg-xinit xorg-xwininfo xcompmgr \
            xorg-xprop libnotify dunst nitrogen man-db noto-fonts \
            noto-fonts-emoji ttf-linux-libertine ttf-inconsolata maim \
            xcape xclip xdotool alacritty i3 picom evince zathura \
            zathura-pdf-mupdf zsh stow tmux sxiv cronie thunar

sudo systemctl start --now cronie.service

echo "Installing yay..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -csi
cd ..

echo "Installing ly dm..."
git clone https://aur.archlinux.org/ly
cd ly;makepkg -csi
sudo systemctl enable ly
cd ..

echo "Installing dmenu..."
git clone https://github.com/Gabriel2233/dmenu_build.git
cd dmenu_build
sudo make clean install
cd ..

yay -S --noconfirm --needed brave-bin autotiling

cd .dotfiles
./stow.sh
cd ..

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

