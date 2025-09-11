#!/usr/bin/env bash
set -e

cd ~/.dotfiles

echo "[[INFO]] Staging all modified files."
git add .

if git diff --staged --quiet; then
  echo "[[WARNING]] No staged changes detected"
  read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
fi

COMMIT_MSG="$(date +"%Y-%m-%d %H:%M:%S")"
echo "[[INFO]] Creating local commit: \"$COMMIT_MSG\""
git commit -m "$COMMIT_MSG"

echo "[[INFO]] Initiating NixOS system rebuild."
if sudo nixos-rebuild switch --flake ~/.dotfiles; then
  echo "[[INFO]] System rebuild completed successfully."
  echo "[[INFO]] Pushing changes to the remote repository."
  git push
  echo "[[INFO]] Workflow completed."
else
  echo "[[ERROR]] System rebuild failed."
  echo "[[INFO]] Reverting the last commit and preserving staged changes."
  git reset --soft HEAD~1
  echo "[[WARNING]] The previous commit has been reverted. File modifications are still staged."
  exit 1
fi

cd -
