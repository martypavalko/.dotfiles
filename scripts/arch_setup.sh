pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-history-substring-search "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search"

git config --global user.name "Marty Pavalko"
git config --global user.email marty@martypavalko.com

mkdir -p /home/marty/.ssh && chmod 700 /home/marty/.ssh
tee -a /home/marty/.ssh <<EOF
Host github.com
    HostName github.com
    PreferredAuthentications publickey
    IdentityFile /home/marty/.ssh/github
EOF

pacman -S fzf ripgrep tmux unzip rust nvm lazygit ghostty
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# pacman -S fzf timeshift btrfs-progs grub-btrfs xorg-xhost
# systemctl enable cronie
