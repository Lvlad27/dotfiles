#!/bin/sh
# laptop.sh - Script to set up the laptop screen as the only active display

# Function to disable a monitor if it is connected
disable_if_connected() {
    if xrandr | grep -q "^$1 connected"; then
        xrandr --output $1 --off
    fi
}

# Disable all external monitors
disable_if_connected HDMI-1
disable_if_connected DP-1
disable_if_connected DP-2
disable_if_connected DVI-I-5-4
disable_if_connected DVI-I-4-3
disable_if_connected DVI-I-3-2
disable_if_connected DVI-I-2-1

# Enable and set the primary monitor to the laptop screen
xrandr --output eDP-11 --primary --auto
