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
  installCmd="$installCmd install"
elif [ $installCmd = "snap" ]; then
  installCmd="$installCmd install"
elif [ $installCmd = "pacman" ]; then
  installCmd="$installCmd -Syu"
elif [ $installCmd = "yay" ]; then
  installCmd="$installCmd -Syu"
else
  echo "$installCmd not supported"
  exit 2
fi

sudo "$installCmd" "$(sed s/#.*// $filename)"
