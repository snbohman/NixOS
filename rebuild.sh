#!/usr/bin/env bash

cd ~/dotfiles
sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix
git add --all
git commit -m "$1"
git push

sudo nixos-rebuild switch --flake .
cd -
