#!/bin/sh

# Programming
sudo pacman -S --noconfirm python
sudo pacman -S --noconfirm ipython
sudo pacman -S --noconfirm python-pip
sudo pip install notebook ipywidgets
#sudo pip install jupytext --upgrade  # convert between ipynb and py or md
sudo pip install numpy matplotlib scipy
sudo pip install pillow  # to be able to save jpgs from matplotlib
sudo pip install xarray
sudo pacman -S --noconfirm python-pyqt5 qt5-svg
sudo pip install sphinx
sudo pip install --upgrade recommonmark
sudo pip install sphinxcontrib-bibtex
sudo pip install nbsphinx nbsphinx-link
sudo pip install pytest
sudo pip install fluiddyn
sudo pip install flake8 flake8-docstrings flake8-rst-docstrings flake8-import-order  # python linters
sudo pacman -S --noconfirm cmake
sudo pacman -S --noconfirm texlive-most
sudo pacman -S --noconfirm gdb
sudo pacman -S --noconfirm ctags

# Virtualbox
sudo pacman -S --noconfirm virtualbox virtualbox-host-dkms
