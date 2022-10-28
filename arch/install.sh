#!/bin/bash

# Window manager
sudo pacman -S --noconfirm xorg-server xorg-xinit i3-gaps i3blocks rxvt-unicode
sudo pacman -S --noconfirm xorg-xprop
sudo pacman -S --noconfirm xorg-xkill
sudo pacman -S --noconfirm compton
sudo pacman -S --noconfirm feh
sudo pacman -S --noconfirm libnotify
sudo pacman -S --noconfirm i3lock
sudo pacman -S --noconfirm dunst  # notification server
sudo pacman -S --noconfirm arandr
sudo pacman -S --noconfirm xdotool
sudo pacman -S --noconfirm neofetch
sudo pacman -S --noconfirm sxhkd

# Fonts
sudo pacman -S --noconfirm ttf-linux-libertine ttf-inconsolata ttf-joypixels
sudo pacman -S --noconfirm ttf-fira-code
sudo pacman -S --noconfirm noto-fonts-cjk
sudo pacman -S --noconfirm noto-fonts-emoji

# zsh
sudo pacman -S --noconfirm zsh
sudo pacman -S --noconfirm zsh-syntax-highlighting

# Display
sudo pacman -S --noconfirm xorg-xbacklight
sudo pacman -S --noconfirm xf86-video-intel
#NOTE: Add xorg.conf

# Basic programs
sudo pacman -S --noconfirm git
sudo pacman -S --noconfirm gvim  # to enable copy-pasting to system clipboard
sudo pacman -S --noconfirm imagemagick
sudo pacman -S --noconfirm ranger w3m  # w3m needed for image previews
sudo pacman -S --noconfirm ueberzug  # image previews with ranger
sudo pacman -S --noconfirm firefox
sudo pacman -S --noconfirm zathura zathura-pdf-mupdf zathura-ps zathura-djvu
sudo pacman -S --noconfirm xournalpp
sudo pacman -S --noconfirm qutebrowser pdfjs
sudo pacman -S --noconfirm libreoffice
sudo pacman -S --noconfirm pandoc pandoc-citeproc
sudo pacman -S --noconfirm zip unzip unrar
sudo pacman -S --noconfirm rsync
sudo pacman -S --noconfirm fzf
sudo pacman -S --noconfirm ripgrep
sudo pacman -S --noconfirm cronie  #TODO: systemctl enable cronie
sudo pacman -S --noconfirm maim  # For screenshots
sudo pacman -S --noconfirm entr  # automate tasks when files update
sudo pacman -S --noconfirm calcurse
sudo pacman -S --noconfirm abook
sudo pacman -S --noconfirm bc
sudo pacman -S --noconfirm perl-image-exiftool
sudo pacman -S --noconfirm odt2txt
sudo pacman -S --noconfirm pinta

# Programming
sudo pacman -S --noconfirm python
sudo pacman -S --noconfirm ipython
sudo pacman -S --noconfirm python-pip
sudo pip install notebook ipywidgets
#sudo pip install jupytext --upgrade  # convert between ipynb and py or md
sudo pip install numpy matplotlib scipy
sudo pip install pillow  # to be able to save jpgs from matplotlib
sudo pip install xarray
sudo pacman -S --noconfirm python-pyqt5 qt5-svg
sudo pip install sphinx
sudo pip install --upgrade recommonmark
sudo pip install sphinxcontrib-bibtex
sudo pip install nbsphinx nbsphinx-link
sudo pip install pytest
sudo pip install fluiddyn
sudo pip install flake8 flake8-docstrings flake8-rst-docstrings flake8-import-order  # python linters
sudo pacman -S --noconfirm cmake
sudo pacman -S --noconfirm texlive-most
sudo pacman -S --noconfirm gdb
sudo pacman -S --noconfirm ctags

# System
sudo pacman -S --noconfirm acpi  # to get battery information
sudo pacman -S --noconfirm pkgfile
sudo pacman -S --noconfirm htop
sudo pacman -S --noconfirm ncdu

# Network
sudo pacman -S --noconfirm openssh
sudo pacman -S --noconfirm sshfs
sudo pacman -S --noconfirm wget
sudo pacman -S --noconfirm ifplugd
sudo pacman -S --noconfirm linux-firmware

# Media
#TODO: Add PulseAudio and other details
sudo pacman -S --noconfirm pulseaudio pamixer alsa-utils
sudo pacman -S --noconfirm pavucontrol
sudo pacman -S --noconfirm mpv

# Misc
sudo pacman -S --noconfirm xclip
sudo pacman -S --noconfirm espeak
sudo pacman -S --noconfirm units  # unit conversion program
sudo pacman -S --noconfirm highlight
sudo pacman -S --noconfirm bat  # cat with syntax highlighting

# Image
#sudo pacman -S --noconfirm eog
sudo pacman -S --noconfirm sxiv
sudo pacman -S --noconfirm gthumb  # quick image editing

# Filesystem tools
sudo pacman -S --noconfirm dosfstools  # for mkfs.vfat
sudo pacman -S --noconfirm ntfsprogs  # for mkfs.ntfs
sudo pacman -S --noconfirm exfat-utils  # to mount exfat: mount -t exfat /dev/sdb1 mountpoint

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
yay -S brave

# Install st
cwd=`pwd`
cd ../programs/st-anantg
sudo make clean install
cd $cwd

# Install dmenu
cwd=`pwd`
cd ../programs/dmenu-anantg
sudo make clean install
cd $cwd

# Install dwm
cwd=`pwd`
cd ../programs/dwm-anantg
sudo make clean install
cd $cwd
