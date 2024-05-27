timedatectl set-timezone US/Eastern
pacman -S sudo vim man-db man-pages texinfo networkmanager zsh
useradd marty && usermod -aG wheel marty
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
yay -S hyprland
pacman -S fakeroot debugedit make gcc cmake dunst pipewire polkit-kde-agent qt5-wayland qt6-wayland sddm xdg-desktop-portal-hyprland layer-shell-qt5 layer-shell-qt wayland xorg-xwayland alacritty wofi dolphin firefox wireplumber pipewire waybar hyprpaper ninja wayland-protocols libjpeg-turbo libwebp pango cairo pkgconf libglvnd wayland openssh fastfetch xdg-desktop-portal gtk4 gtk3

tee -a /etc/sddm.conf.d/10-wayland.conf <<EOF
[General]
DisplayServer=wayland
GreeterEnvironment=QT_WAYLAND_SHELL_INTEGRATION=layer-shell

[Wayland]
CompositorCommand=kwin_wayland --drm --no-lockscreen --no-global-shortcuts --locale1
EOF

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git config --global user.name "Marty Pavalko"
git config --global user.email marty@martypavalko.com

mkdir -p /home/marty/.ssh && chmod 700 /home/marty/.ssh
tee -a /home/marty/.ssh <<EOF
Host github.com
    HostName github.com
    PreferredAuthentications publickey
    IdentityFile /home/marty/.ssh/github
EOF

pacman -S starship fzf papirus-icon-theme timeshift btrfs-progs grub-btrfs xorg-xhost noto-fonts-emoji
systemctl enable cronie
yay -S brightnessctl
