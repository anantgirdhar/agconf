#!/bin/sh

# Requires python and pip to already be installed

sudo apt install python3-virtualenv
# Setup the "main" virtualenv
[ ! -d "$HOME/.local/share/virtualenv" ] && mkdir -p "$HOME/.local/share/virtualenv"
virtualenv $HOME/.local/share/virtualenv/py
# Install all the packages inside this virtualenv
. $HOME/.local/share/virtualenv/py/bin/activate
pip install -r ./install/python_requirements_main.txt
deactivate

sudo apt install pipx
pipx install ruff
