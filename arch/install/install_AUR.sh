#!/bin/sh

# Install the yaourt AUR helper
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

# Then install the yay helper
yaourt -S --noconfirm yay
# Go back to the current working directory
cd "$cwd"
