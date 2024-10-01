#!/bin/sh

sudo apt install curl apt-transport-https

if [ ! -f /usr/share/keyrings/librewolf.gpg ]; then
  wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor | sudo tee /usr/share/keyrings/librewolf.gpg
fi

distro=$(lsb_release -cs)
if echo "focal groovy impish jammy kinetic lunar mantic" | grep -q "$distro"; then
  :
else
  distro=jammy
fi

# if [ ! -f /etc/apt/sources.list.d/librewolf.list ]; then
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/librewolf.gpg] http://deb.librewolf.net $distro main" | sudo tee /etc/apt/sources.list.d/librewolf.list
# fi

sudo apt update
sudo apt install librewolf
