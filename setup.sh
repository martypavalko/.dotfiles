#!/bin/bash
sudo pacman -Syyu
sudo pacman -S alacritty zsh i3-gaps polybar rofi python3 neovim ranger tmux npm firefox arandr base-devel binutils make gcc fakeroot 
cd ~
sudo git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si
cd ~
git config --global user.email "marty.pavalko@gmail.com"
git config --global user.name "martypavalko"
yay -Syu
yay -S nvim-packer-git
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
