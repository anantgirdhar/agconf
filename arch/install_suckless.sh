#!/bin/sh

# Set the build directory to be inside the main config directory so that we can
# use the config_edit script
BUILDDIR="../programs"
[ ! -d "$BUILDDIR" ] && mkdir "$BUILDDIR"

# Save the current working directory to return to it later
CWD=`pwd`

# Move to the build directory
cd "$BUILDDIR"

# Install dwm
git clone "git@github.com:anantgirdhar/dwm-anantg.git"
cd dwm-anantg
sudo make clean install
cd ../

# Install dmenu
git clone "git@github.com:anantgirdhar/dmenu-anantg.git"
cd dmenu-anantg
sudo make clean install
cd ../

# Install dwmblocks
git clone "git@github.com:anantgirdhar/dwmblocks.git"
cd dwmblocks
sudo make clean install
cd ../

# Install st
git clone "git@github.com:anantgirdhar/st-anantg.git"
cd st-anantg
sudo make clean install
cd ../

# Return to the original working directory
cd "$CWD"
