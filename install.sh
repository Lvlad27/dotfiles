#!/bin/bash

mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim/undo"
ln -sf "$HOME/dotfiles/nvim/init.vim" "$HOME/.config/nvim/init.vim"

ln -sf "$HOME/dotfiles/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
