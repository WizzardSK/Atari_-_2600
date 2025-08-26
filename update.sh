#!/bin/bash

cd "$GITHUB_WORKSPACE/Named_Snaps"

for file in "${1:-.}"/*; do
    [ -f "$file" ] || continue    
    old=$(basename "$file")
    new=$(echo "$old" | sed 's/\[[^]]*\]//g; s/{[^}]*}//g; s/(/###FIRST###/; s/([^)]*)//g; s/###FIRST###/(/; s/  */ /g; s/^ *//; s/ *$//')
    [ "$old" != "$new" ] && [ ! -e "$(dirname "$file")/$new" ] && mv "$file" "$(dirname "$file")/$new" && echo "$old -> $new"
done

cd "$GITHUB_WORKSPACE/Named_Titles"
cd "$GITHUB_WORKSPACE/Named_Boxarts"
cd "$GITHUB_WORKSPACE/Named_Logos"

cd "$GITHUB_WORKSPACE"
git add .
git config --global user.name "GitHub Actions"
git config --global user.email "actions@github.com"
git commit -m "Auto update ($(date +'%Y-%m-%d %H:%M:%S'))"
#git push
