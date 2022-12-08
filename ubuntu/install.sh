#!/bin/sh

# Install all the things needed to make this a functional system

sudo apt install $(sed s/#.*// install/system.list)
sudo apt install $(sed s/#.*// install/utilities.list)
sudo apt install $(sed s/#.*// install/programming.list)

sudo snap install $(sed s/#.*// install/snaps.list)

./install/setup_python.sh

./install/install_librewolf.sh
