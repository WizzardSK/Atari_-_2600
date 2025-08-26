#!/bin/bash

cd "$GITHUB_WORKSPACE/Named_Snaps"
cd "$GITHUB_WORKSPACE/Named_Titles"
cd "$GITHUB_WORKSPACE/Named_Boxarts"
cd "$GITHUB_WORKSPACE/Named_Logos"

cd "$GITHUB_WORKSPACE"
git add .
git config --global user.name "GitHub Actions"
git config --global user.email "actions@github.com"
git commit -m "Auto update ($(date +'%Y-%m-%d %H:%M:%S'))"
git push
