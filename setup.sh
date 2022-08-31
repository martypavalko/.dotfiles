#!/bin/bash
sudo pacman -Syyu
sudo pacman -S alacritty zsh i3-wm polybar rofi python3 yay git neovim
cd ~/
git clone git@github.com:martypavalko/Dotfiles.git
git config --global user.email "marty.pavalko@gmail.com"
git config --global user.name "martypavalko"
git clone git@github.com:martypavalko/Dotfiles.git
ln -s /home/marty/.config/i3/config /home/marty/Dotfiles/.config/i3/config
ln -s /home/marty/.config/alacritty/alacritty.yml /home/marty/Dotfiles/.config/alacritty/alacritty.yml
ln -s /home/marty/.zshrc /home/marty/Dotfiles/.zshrc
