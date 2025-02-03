# #!/bin/sh
# xrandr --output eDP-1 --mode 1920x1080 --pos 1920x1080 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DVI-I-5-4 --off --output DVI-I-4-3 --off --output DVI-I-3-2 --off --output DVI-I-2-1 --mode 1920x1080 --pos 3840x0 --rotate normal

#!/bin/sh
# xrandr --output eDP-1 --mode 1920x1080 --pos 3840x0 --rotate normal \
#   --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal \
#   --output DP-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal \
#   --output DVI-I-3-2 --mode 1920x1080 --pos 5760x0 --rotate normal
#
# # Apply color correction for DP-1
# for output in $(xrandr | grep " connected" | cut -d " " -f1); do
#   xrandr --output "$output" --set "Broadcast RGB" "Full" 2>/dev/null
# done
#
xrandr --output eDP-1 --mode 1920x1080 --pos 1920x1080 --rotate normal \
  --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal \
  --output DP-1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal \
  --output DVI-I-2-1 --mode 1920x1080 --pos 3840x0 --rotate normal

# Apply color correction to all connected monitors
for output in $(xrandr | grep " connected" | awk '{print $1}'); do
  echo "Setting Broadcast RGB to Full for $output"
  xrandr --output "$output" --set "Broadcast RGB" "Full" 2>/dev/null ||
    echo "Could not set Broadcast RGB for $output"
done
