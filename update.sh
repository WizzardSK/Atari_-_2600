#!/bin/bash

cd ~/Named_Snaps
for f in *.png; do mv -v -- "$f" "$(echo "$f" | sed -E 's/^(.*\([0-9]{4}\))\..*/\1.png/')"; done
cd ~/Named_Titles
for f in *.png; do mv -v -- "$f" "$(echo "$f" | sed -E 's/^(.*\([0-9]{4}\))\..*/\1.png/')"; done
cd ~/Named_Boxarts
for f in *.png; do mv -v -- "$f" "$(echo "$f" | sed -E 's/^(.*\([0-9]{4}\))\..*/\1.png/')"; done
cd ~/Named_Logos
for f in *.png; do mv -v -- "$f" "$(echo "$f" | sed -E 's/^(.*\([0-9]{4}\))\..*/\1.png/')"; done

cd "$GITHUB_WORKSPACE"
git add .
git config --global user.name "GitHub Actions"
git config --global user.email "actions@github.com"
git commit -m "Auto update ($(date +'%Y-%m-%d %H:%M:%S'))"
git push
