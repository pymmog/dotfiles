#!/bin/bash

# Package lists
PACMAN_PKGS="tmux waybar hyprpaper ghostty neovim spotify"
BASE_PKGS="base-devel git"
EXTRA_PKGS="pavucontrol stow"
FONT_PKGS="ttf-jetbrains-mono-nerd ttf-font-awesome ttf-nerd-fonts-symbols"
AUR_PKGS="1password zen-browser-bin"

sudo -v
sudo pacman -Syu --noconfirm
echo "System update finished"
sudo pacman -S $PACMAN_PKGS --noconfirm
echo "$PACMAN_PKGS installation finished"
sudo pacman -S --needed $BASE_PKGS --noconfirm
echo "$BASE_PKGS installation finished"
sudo pacman -S $EXTRA_PKGS --noconfirm
echo "$EXTRA_PKGS installation finished"
sudo pacman -S $FONT_PKGS --noconfirm
echo "$FONT_PKGS installation finished"
fc-cache -r
echo "Font cache refresh finished"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
echo "yay build finished"
yay -S $AUR_PKGS --noconfirm
echo "$AUR_PKGS installation finished"
