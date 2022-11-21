#!/bin/sh

# Basic programs
sudo pacman -S --noconfirm git
sudo pacman -S --noconfirm gvim  # to enable copy-pasting to system clipboard
sudo pacman -S --noconfirm imagemagick
sudo pacman -S --noconfirm ranger w3m  # w3m needed for image previews
sudo pacman -S --noconfirm lf
sudo pacman -S --noconfirm ueberzug  # image previews with ranger
sudo pacman -S --noconfirm firefox
sudo pacman -S --noconfirm zathura zathura-pdf-mupdf zathura-ps zathura-djvu
sudo pacman -S --noconfirm xournalpp
sudo pacman -S --noconfirm qutebrowser pdfjs
sudo pacman -S --noconfirm libreoffice
sudo pacman -S --noconfirm pandoc
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
sudo pacman -S --noconfirm jq

# Image
#sudo pacman -S --noconfirm eog
sudo pacman -S --noconfirm sxiv
sudo pacman -S --noconfirm gthumb  # quick image editing

# Misc
sudo pacman -S --noconfirm xclip
sudo pacman -S --noconfirm espeak
sudo pacman -S --noconfirm units  # unit conversion program
sudo pacman -S --noconfirm highlight
sudo pacman -S --noconfirm bat  # cat with syntax highlighting
sudo pacman -S --noconfirm gnuplot
