#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# disable screen turn off
xset s off
xset -dpms

# merge in defaults and keymaps

if [ -f $sysresources ]; then

	xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
	xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

	xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
	xmodmap "$usermodmap"
fi


# Set cursor size
export XCURSOR_SIZE=14

# Disable middle mouse button paste
# This requires knowing the device ID and the button mapping, the default is to disable button 2
MOUSE_ID=$(xinput list | grep -i mouse | head -n 1 | grep -o 'id=[0-9]*' | cut -d '=' -f 2)
xinput set-button-map "$MOUSE_ID" 1 0 3

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login
exec i3
