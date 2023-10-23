#!/bin/sh

# Install all the things needed to make this a functional system

../install_helper.sh apt install/system.list
../install_helper.sh apt install/utilities.list
../install_helper.sh apt install/programming.list

../install_helper.sh snap install/snaps.list

./install/setup_python.sh

./install/install_ungoogled_chromium.sh
