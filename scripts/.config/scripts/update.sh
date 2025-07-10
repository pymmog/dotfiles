#!/bin/bash
success=true
echo "Updating packages..."
yay -Syu || { echo "Error updating packages"; success=false; }
echo "Removing orphaned packages..."
sudo pacman -Rns $(pacman -Qdtq) || { echo "Error removing orphaned packages"; success=false; }
echo "Cleaning pacman cache..."
sudo paccache -rk2 || { echo "Error cleaning pacman cache"; success=false; }
echo "Cleaning yay cache..."
for d in ~/.cache/yay/*; do [ -d "$d" ] && cd "$d" && ls -t *.pkg.tar.zst | tail -n +2 | xargs rm -f 2>/dev/null || echo "Error cleaning yay cache for $(basename "$d")" && success=false; done
if $success; then echo "Everything is up to date and cleaned up"; else echo "Some errors occurred"; fi
