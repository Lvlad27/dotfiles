#!/bin/bash

# Array of directories to be deleted
directories=(
    "~/.local/state/nvim"
    "~/.local/share/nvim"
    "~/.config/local/share/nvim"
    "~/.config/nvim"
    "~/.config/cache/nvim"
)

# Loop through the directories and delete each one
for dir in "${directories[@]}"; do
    # Expand the ~ to the actual home directory
    expanded_dir=$(eval echo $dir)

    # Check if the directory exists
    if [ -d "$expanded_dir" ]; then
        # Delete the directory and its contents
        rm -rf "$expanded_dir"
        echo "Directory $expanded_dir has been deleted."
    else
        echo "Directory $expanded_dir does not exist."
    fi
done
