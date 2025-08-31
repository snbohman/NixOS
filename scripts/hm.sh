#!/usr/bin/env bash

cd ~/.dotfiles

if ! git diff --quiet || ! git diff --cached --quiet; then
    git add --all
    git commit -m "$(date +"%Y-%m-%d %H:%M:%S")"
    git push
else
    echo "[Config] - No changes to commit."
fi

home-manager switch --flake .#snbohman

cd -
