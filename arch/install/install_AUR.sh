#!/bin/sh

# AUR
cwd=`pwd`
mkdir /tmp/yaourt_install
cd /tmp/yaourt_install
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ../
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ../../
rm -rf yaourt_install
yaourt -S --noconfirm yay
# Go back to the current working directory
cd "$cwd"

# Android mounting tool
yay -S --noconfirm simple-mtpfs

# Symbola font (because noto-fonts-emoji was breaking with st)
yay -S --noconfirm ttf-symbola

# To get color emoji support in dwm
# Otherwise, dwm just crashes
yay -S libxft-bgra-git

yay -S zsh-you-should-use
yay -S brave-bin
