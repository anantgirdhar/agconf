#!/bin/sh

# Requires python and pip to already be installed

pip install virtualenv
# Setup the "main" virtualenv
[ ! -d "$HOME/.local/share/virtualenv" ] && mkdir -p "$HOME/.local/share/virtualenv"
$HOME/.local/bin/virtualenv $HOME/.local/share/virtualenv/py
# Install all the packages inside this virtualenv
source $HOME/.local/share/virtualenv/py/bin/activate
pip install -r python_requirements_main.txt
deactivate
