#!/bin/sh

echo 'deb http://download.opensuse.org/repositories/home:/ungoogled_chromium/Ubuntu_Lunar/ /' | sudo tee /etc/apt/sources.list.d/home:ungoogled_chromium.list
curl -fsSL https://download.opensuse.org/repositories/home:ungoogled_chromium/Ubuntu_Lunar/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_ungoogled_chromium.gpg > /dev/null
sudo apt update
sudo apt install ungoogled-chromium
