#!/bin/bash
sudo pacman -Syyu
sudo pacman -S alacritty zsh i3-gaps polybar rofi python3 neovim ranger tmux npm firefox arandr
cd ~/
git config --global user.email "marty.pavalko@gmail.com"
git config --global user.name "martypavalko"
git clone --depth 1 "https://github.com/wbthomason/packer.nvim" "~/.local/share/nvim/site/pack/packer/start/packer.nvim"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
