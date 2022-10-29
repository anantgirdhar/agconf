#!/bin/sh

# Window manager
sudo pacman -S --noconfirm xorg-server xorg-xinit i3-gaps i3blocks rxvt-unicode
sudo pacman -S --noconfirm xorg-xprop
sudo pacman -S --noconfirm xorg-xkill
sudo pacman -S --noconfirm xorg-xbacklight
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

# Filesystem tools
sudo pacman -S --noconfirm dosfstools  # for mkfs.vfat
sudo pacman -S --noconfirm ntfsprogs  # for mkfs.ntfs
sudo pacman -S --noconfirm exfat-utils  # to mount exfat: mount -t exfat /dev/sdb1 mountpoint
