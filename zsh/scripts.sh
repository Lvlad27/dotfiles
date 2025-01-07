#!/bin/zsh
compress() {
    tar cvzf $1.tar.gz $1
}

# Function to open files in Neovim with Alacritty
nvim_open() {
    alacritty -e nvim "$@"
}

case "$1" in
    "nvim")
        shift  # Remove the first argument
        nvim_open "$@"
        ;;
    "compress")
        shift
        compress "$@"
        ;;
    esac
