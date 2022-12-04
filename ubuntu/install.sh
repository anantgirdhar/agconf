#!/bin/sh

# Install all the things needed to make this a functional system

sudo apt install $(sed s/#.*// install/system.list)
sudo apt install $(sed s/#.*// install/utilities.list)
sudo apt install $(sed s/#.*// install/programming.list)

./install/setup_python.sh
