#!/bin/bash
sudo -v
sudo pacman -Syu --noconfirm
sudo pacman -S tmux waybar hyprpaper ghostty neovim spotify --noconfirm
sudo pacman -S --needed base-devel git --noconfirm
sudo pacman -S pavucontrol
sudo pacman -S stow
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
yay -S 1password zen-browser-bin --noconfirm
