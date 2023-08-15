#!/usr/bin/env sh

WIDTH=${WIDTH:-200}
HEIGHT=${HEIGHT:-200}
DATEFMT=${DATEFMT:-"+%a %d.%m.%Y %H:%M:%S"}
SHORTFMT=${SHORTFMT:-"+%H:%M:%S"}

OPTIND=1
while getopts ":f:W:H:" opt; do
    case $opt in
        f) DATEFMT="$OPTARG" ;;
        W) WIDTH="$OPTARG" ;;
        H) HEIGHT="$OPTARG" ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

case "$BLOCK_BUTTON" in
  1|2|3) 

    # get screen resolution
    SCREEN_WIDTH=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d'x' -f1)
    SCREEN_HEIGHT=$(xdpyinfo | awk '/dimensions/{print $2}' | cut -d'x' -f2)

    # calculate the position of the lower right corner of the popup
    posX=$(($SCREEN_WIDTH - $WIDTH - 28))
    posY=$(($SCREEN_HEIGHT - $HEIGHT - 60))

    i3-msg -q "exec yad --calendar \
        --width=$WIDTH --height=$HEIGHT \
        --undecorated --fixed \
        --close-on-unfocus --no-buttons \
        --posx=$posX --posy=$posY \
        > /dev/null"
esac
echo "$LABEL$(date "$DATEFMT")"
echo "$LABEL$(date "$SHORTFMT")"

