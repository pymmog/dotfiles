#!/bin/bash
echo "Starting sudo validation"
sudo -v
echo "Finished sudo validation"
echo "Starting system update"
sudo pacman -Syu --noconfirm
echo "Finished system update"
echo "Starting package installation (tmux, waybar, hyprpaper, ghostty, neovim, spotify)"
sudo pacman -S tmux waybar hyprpaper ghostty neovim spotify --noconfirm
echo "Finished package installation (tmux, waybar, hyprpaper, ghostty, neovim, spotify)"
echo "Starting base-devel and git installation"
sudo pacman -S --needed base-devel git --noconfirm
echo "Finished base-devel and git installation"
echo "Starting pavucontrol installation"
sudo pacman -S pavucontrol
echo "Finished pavucontrol installation"
echo "Starting stow installation"
sudo pacman -S stow
echo "Finished stow installation"
echo "Starting font installation"
sudo pacman -S ttf-jetbrains-mono-nerd ttf-font-awesome ttf-nerd-fonts-symbols
echo "Finished font installation"
echo "Starting font cache refresh"
fc-cache -r
echo "Finished font cache refresh"
echo "Starting yay AUR helper cloning"
git clone https://aur.archlinux.org/yay.git
echo "Finished yay AUR helper cloning"
echo "Starting yay build"
cd yay
makepkg -si --noconfirm
cd ..
echo "Finished yay build"
echo "Starting AUR package installation (1password, zen-browser-bin)"
yay -S 1password zen-browser-bin --noconfirm
echo "Finished AUR package installation (1password, zen-browser-bin)"
