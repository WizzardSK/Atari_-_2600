#!/bin/bash
rm -f archive.zip
zip -r archive.zip *
git config --global user.name "GitHub Actions"
git config --global user.email "actions@github.com"
git add archive.zip
git commit -m "Auto update ($(date +'%Y-%m-%d %H:%M:%S'))"
git push
