#!/bin/sh

# Install a list of packages contained in a file

Usage() {
  echo "$0 <packageManager> <filename>"
  echo
  echo "Use this script to install packages on a system."
  echo "<packageManager> is the package manager used to install. This should be one of:"
  echo "  - apt (will use apt install)"
  echo "  - snap (will use snap install)"
  echo "  - pacman (will use pacman -Syu)"
  echo "  - yay (will use pacman -Syu)"
  echo "<filename> is the nme of the file that contains the list of the packages"
  echo "NOTE: This will use sudo and install packages systemwide."
}

installCmd=$1
[ -z $installCmd ] && Usage && exit 1
filename=$2
[ -z $filename ] && Usage && exit 1

if [ $installCmd = "apt" ]; then
  sudo apt install $(sed s/#.*// $filename)
elif [ $installCmd = "snap" ]; then
  sudo snap install $(sed s/#.*// $filename)
elif [ $installCmd = "pacman" ]; then
  sudo pacman -S $(sed s/#.*// $filename)
elif [ $installCmd = "yay" ]; then
  sudo yay -S $(sed s/#.*// $filename)
else
  echo "$installCmd not supported"
  exit 2
fi
