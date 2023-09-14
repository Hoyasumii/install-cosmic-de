#!/bin/bash

echo "Installing dependencies..."
sudo apt update -y  > /dev/null 2>&1
sudo apt install just rustc libglvnd-dev libwayland-dev libseat-dev libxkbcommon-dev libinput-dev libgtk-4-1 udev dbus libdbus-1-dev libsystemd-dev libpulse-dev pop-launcher libexpat1-dev libfontconfig-dev libfreetype-dev lld cargo libgbm-dev libclang-dev libpipewire-0.3-dev -y > /dev/null 2>&1

echo "Installing Cosmic Epoch..."
git clone --recurse-submodules https://github.com/pop-os/cosmic-epoch ~/.cosmic-epoch > /dev/null 2>&1

echo "Building Cosmic Epoch..."
cd ~/.cosmic-epoch
just sysext

if [ -d "/var/lib/extensions" ]; then
    sudo mkdir /var/lib/extensions
fi

sudo cp -r ~/.cosmic-epoch/cosmic-sysext /var/lib/extensions/cosmic-sysext

sudo systemctl enable --now systemd-sysext
echo "Done!"

# TODO: Testar
