#!/usr/bin/env bash

cd ~/.dotfiles

if ! git diff --quiet || ! git diff --cached --quiet; then
    git add --all
    git commit -m "$(date +"%Y-%m-%d %H:%M:%S")"
else
    echo "[Config] - No changes to commit."
fi

sudo nixos-rebuild switch --flake ~/.dotfiles && git push --quiet

cd -
