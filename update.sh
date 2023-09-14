#!/bin/bash

echo "Updating dependencies..."
sudo apt update -y  > /dev/null 2>&1
cd ~/.cosmic-epoch
git pull

echo "Building Cosmic Epoch..."
just sysext

if [ -d "/var/lib/extensions" ]; then
    sudo mkdir /var/lib/extensions
fi

sudo cp -r ~/.cosmic-epoch/cosmic-sysext /var/lib/extensions

sudo systemctl enable --now systemd-sysext
echo "Done!"

#TODO: Testar