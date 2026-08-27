#!/usr/bin/env bash

cd ~/.config/nixos

if ! git diff --quiet || ! git diff --cached --quiet; then
    git add --all
    git commit -m "$(date +"%Y-%m-%d %H:%M:%S")"
else
    echo "[Config] - No changes to commit."
fi

sudo nixos-rebuild switch --flake ~/.config/nixos#primary && git push --quiet -u origin main

cd -
