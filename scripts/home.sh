#!/usr/bin/env bash

cd ~/.dotfiles

if ! git diff --quiet || ! git diff --cached --quiet; then
  git add --all
  git commit -m "$(date +"%Y-%m-%d %H:%M:%S")"
  git push
else
  echo "No changes to commit."
fi

sudo home-manger switch --flake .

cd -
