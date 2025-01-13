#!/bin/bash

export XDG_CONFIG_HOME=$HOME/.config
export DOTFILES=~/dotfiles

mkdir -p "$XDG_CONFIG_HOME/X11"

# Handle symbolic link creation for X11
if [ -L "$XDG_CONFIG_HOME/X11" ]; then
  rm "$XDG_CONFIG_HOME/X11"
elif [ -e "$XDG_CONFIG_HOME/X11" ]; then
  echo "Error: $XDG_CONFIG_HOME/X11 exists but is not a symbolic link."
  exit 1
fi
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME/X11"

# Handle symbolic link creation for nvim
ln -sf "$DOTFILES/nvim" "$XDG_CONFIG_HOME"

# Handle symbolic link creation for alacritty
if [ -L "$XDG_CONFIG_HOME/alacritty" ]; then
  rm "$XDG_CONFIG_HOME/alacritty"
elif [ -e "$XDG_CONFIG_HOME/alacritty" ]; then
  echo "Backing up existing alacritty config directory..."
  mv "$XDG_CONFIG_HOME/alacritty" "$XDG_CONFIG_HOME/alacritty.backup.$(date +%Y%m%d_%H%M%S)"
fi
ln -s "$DOTFILES/alacritty" "$XDG_CONFIG_HOME/alacritty"

# Handle symbolic link creation for i3
if [ -L "$XDG_CONFIG_HOME/i3" ]; then
  rm "$XDG_CONFIG_HOME/i3"
elif [ -e "$XDG_CONFIG_HOME/i3" ]; then
  echo "Error: $XDG_CONFIG_HOME/i3 exists but is not a symbolic link."
  exit 1
fi
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME/i3"

# Handle symbolic link creation for polybar
if [ -L "$XDG_CONFIG_HOME/polybar" ]; then
  rm "$XDG_CONFIG_HOME/polybar"
elif [ -e "$XDG_CONFIG_HOME/polybar" ]; then
  echo "Error: $XDG_CONFIG_HOME/polybar exists but is not a symbolic link."
  exit 1
fi
ln -s "$DOTFILES/polybar" "$XDG_CONFIG_HOME/polybar"

# Handle zsh
mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
if [ -L "$XDG_CONFIG_HOME/zsh/external" ]; then
  rm "$XDG_CONFIG_HOME/zsh/external"
elif [ -e "$XDG_CONFIG_HOME/zsh/external" ]; then
  echo "Error: $XDG_CONFIG_HOME/zsh/external exists but is not a symbolic link."
  exit 1
fi
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"

# Fonts
mkdir -p "$HOME/.local/share/fonts"
cp -rf "$DOTFILES/fonts/"* "$HOME/.local/share/fonts/"
fc-cache -fv

# dunst
mkdir -p "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"

# tmux
mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"
if [ ! -d "$XDG_CONFIG_HOME/tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$XDG_CONFIG_HOME/tmux/plugins/tpm"
fi

# picom
mkdir -p "$XDG_CONFIG_HOME/picom"
ln -sf "$DOTFILES/picom/picom.conf" "$XDG_CONFIG_HOME/picom/picom.conf"
