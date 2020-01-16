#!/bin/bash

DOT_PATH=~/dotfiles

for f in .??*
do
  [ "$f" = ".git" -o "$f" = ".DS_store" ] && continue

  ln -sfnv "$DOT_PATH/$f" "$HOME"/"$f"
done

echo "Complete!"