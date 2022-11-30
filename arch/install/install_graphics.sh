#!/bin/sh

# Graphics Drivers
# Depending on the system, ask the user what to do
echo "Installing graphics drivers. Please select the configuration from this list:"
echo "  1. Intel iGPU"
echo "  2. AMD iGPU + Nvidia dGPU"
echo -n "Enter the option number: "
read configuration

case $configuration in
  "1") sudo pacman -S --noconfirm xf86-video-intel ;;
  "2")
    sudo pacman -S --noconfirm xf86-video-amdgpu mesa \
        nvidia nvidia-utils nvidia-settings nvidia-prime bbswitch
    yay -S optimus-manager
    echo "Make sure to enable optimus-manager.service"
    echo "Also, reboot the system"
    ;;
esac

#NOTE: Add xorg.conf
