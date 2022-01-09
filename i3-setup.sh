#!/bin/sh
echo "Installing packages..."
sudo pacman -Syyu --needed libnotify dunst nitrogen man-db noto-fonts \
            noto-fonts-emoji maim xclip alacritty i3 picom \
            zsh stow tmux sxiv htop

echo "Installing yay..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -csi
cd ..

echo "Installing dmenu..."
git clone https://github.com/Gabriel2233/dmenu_build.git
cd dmenu_build
sudo make clean install
cd ..

yay -S --noconfirm --needed autotiling

cd .dotfiles
./stow.sh
cd ..

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
