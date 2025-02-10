#!/usr/bin/env bash

echo "Installing nix..."
if ! [ -x "$(command -v nix)" ]; then
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
    echo "Nix installed successfully!"
else
    echo "Nix is already installed!"
fi

echo "Installing home-manager..."
if ! [ -x "$(command -v home-manager)" ]; then
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    nix-shell '<home-manager>' -A install
    echo "home-manager installed successfully!"
else
    echo "home-manager is already installed"
fi

echo "Reload your shell!"
