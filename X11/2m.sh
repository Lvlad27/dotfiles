#!/bin/sh
xrandr --output eDP-1 --mode 1920x1080 --pos 1920x1080 --rotate normal \
  --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal

xrandr --output eDP-1 --set "Broadcast RGB" "Full"
xrandr --output HDMI-1 --set "Broadcast RGB" "Full"
