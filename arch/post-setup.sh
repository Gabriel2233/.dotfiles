#!/bin/sh

sudo pacman -S --needed --noconfirm xorg-server xorg-xbacklight xorg-xinit xorg-xwininfo xcompmgr \
            xorg-xprop libnotify dunst nitrogen man-db noto-fonts \
            noto-fonts-emoji ttf-linux-libertine ttf-inconsolata maim \
            xcape xclip xdotool alacritty i3 picom evince zathura \
            zathura-pdf-mupdf zsh stow tmux sxiv

echo "Installing yay..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..

echo "Installing ly dm..."
git clone https://aur.archlinux.org/ly
cd ly;makepkg -si
sudo systemctl enable ly
cd ..

yay -S brave-bin autotiling onlyoffice-bin

.dotfiles/stow.sh
