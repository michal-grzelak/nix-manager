#!/usr/bin/env bash

echo "Installing nix..."
if ! [ -x "$(command -v nix)" ]; then
    curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate
    echo "Nix installed successfully!"
else
    echo "Nix is already installed!"
fi

echo "Reload your shell!"
