#!/bin/bash

# Temporary file for the screenshot
img=/tmp/i3lock.png

# Take a screenshot
scrot $img

# Get information about the monitors
monitors=$(xrandr --query | grep ' connected' | cut -d' ' -f1)
monitor_args=""

# Process each monitor
for monitor in $monitors; do
    # Get the resolution and offset for the monitor
    resolution=$(xrandr --query | grep $monitor | cut -d' ' -f3 | cut -d'+' -f1)
    offset=$(xrandr --query | grep $monitor | cut -d' ' -f3 | cut -d'+' -f2,3)

    # Create a blurred version for this monitor and append to the argument list
    monitor_args="$monitor_args $img -crop $resolution+$offset -scale 10% -scale 1000% -crop $resolution+$offset +repage"
done

# Combine the blurred images
convert $img $monitor_args -background none -flatten $img

# Lock the screen with the combined image
i3lock -u -i $img

# Remove the temporary file
rm $img
