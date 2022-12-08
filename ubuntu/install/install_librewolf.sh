#!/bin/sh

if [ ! -f /usr/share/keyrings/librewolf.gpg ]; then
  wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor | sudo tee /usr/share/keyrings/librewolf.gpg
fi

if [ ! -f /etc/apt/sources.list.d/librewolf.list ]; then
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/librewolf.gpg] http://deb.librewolf.net $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/librewolf.list
fi

sudo apt update
sudo apt install librewolf
