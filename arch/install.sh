#!/bin/sh

# Install all the things needed to make this a functional system

../install_helper.sh pacman install/system.list
../install_helper.sh pacman install/utilities.list

./install/install_AUR.sh

../install_helper.sh yay install/aur_packages.list

./install/install_graphics.sh

../install_helper.sh pacman install/programming.list
./install/setup_python.sh
