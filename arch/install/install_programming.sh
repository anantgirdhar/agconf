#!/bin/sh

# Python
sudo pacman -S --noconfirm python
sudo pacman -S --noconfirm python-pip
pip install virtualenv
# Setup the "main" virtualenv
[ ! -d "$HOME/.local/share/virtualenv" ] && mkdir -p "$HOME/.local/share/virtualenv"
$HOME/.local/bin/virtualenv $HOME/.local/share/virtualenv/py
# Install all the packages inside this virtualenv
source $HOME/.local/share/virtualenv/py/bin/activate
pip install -r python_requirements_main.txt
deactivate

# I don't remember why this was needed so I'm commenting it out for now
# Hopefully nothing breaks, but if something does, then we'll know!
#sudo pacman -S --noconfirm python-pyqt5 qt5-svg

# Misc programming tools
sudo pacman -S --noconfirm cmake
sudo pacman -S --noconfirm gdb
sudo pacman -S --noconfirm ctags
sudo pacman -S --noconfirm texlive-most
sudo pacman -S --noconfirm biber

# Virtualbox
sudo pacman -S --noconfirm virtualbox virtualbox-host-dkms virtualbox-guest-iso virtualbox-guest-utils
