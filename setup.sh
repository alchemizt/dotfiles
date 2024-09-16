#!/bin/bash

# Array of dotfiles
dotfiles=(".bashrc" ".profile" ".zshrc")

# Loop through each dotfile
for file in "${dotfiles[@]}"; do
  # Check if the file exists in the home directory
  if [ -f "$HOME/$file" ]; then
    # Copy the file to the current directory
    cp "$HOME/$file" .
    echo "Copied $file to the current directory."
  else
    echo "$file does not exist in the home directory."
  fi
done

