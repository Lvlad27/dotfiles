#!/bin/bash

# Variables
TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')
OUTPUT_VIDEO="$HOME/Videos/screen_record_$TIMESTAMP.mp4"
PALETTE="$HOME/Videos/palette.png"
OUTPUT_GIF="$HOME/Videos/screen_record_$TIMESTAMP.gif"
SCREEN_SIZE="1920x1080"
FRAMERATE="30"
OFFSET="+1920,0"

# Start recording notification
notify-send -t 3000 'Screen Recording' 'Started recording on DP-2'

# Record the screen
ffmpeg -video_size $SCREEN_SIZE -framerate $FRAMERATE -f x11grab -i :0.0$OFFSET $OUTPUT_VIDEO

# Stop recording notification (this will be handled externally)
notify-send -t 3000 'Screen Recording' 'Stopped recording'

# Generate palette with optimization
ffmpeg -i $OUTPUT_VIDEO -vf "fps=10,scale=$SCREEN_SIZE:flags=lanczos,palettegen=stats_mode=diff" $PALETTE
