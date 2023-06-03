#!/bin/bash

mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim/undo"
mkdir -p "$HOME/.config/X11"

ln -sf "$HOME/dotfiles/nvim/init.vim" "$HOME/.config/nvim/init.vim"
ln -sf "$HOME/dotfiles/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
rm -rf "$HOME/.config/i3"
ln -s "$HOME/dotfiles/i3" "$HOME/.config"
