#! /bin/sh

SCREEN=`xrandr --listmonitors | grep "0:" | awk '{ print $4 }'`

STYLUS=`xinput | sed -nE "s/.*Pen stylus.*id=([0-9]+).*/\1/p"`
ERASER=`xinput | sed -nE "s/.*Pen eraser.*id=([0-9]+).*/\1/p"`
FINGER=`xinput | sed -nE "s/.*Finger touch.*id=([0-9]+).*/\1/p"`

TRACKPOINT=`xinput | sed -nE "s/.*TrackPoint.*id=([0-9]+).*/\1/p"`
TOUCHPAD=`xinput | sed -nE "s/.*Touchpad.*id=([0-9]+).*/\1/p"`
KEYBOARD=`xinput | sed -nE "s/.*AT.*keyboard.*id=([0-9]+).*/\1/p"`

IDS_TO_ROTATE="{$STYLUS $FINGER $ERASER}"
IDS_TO_DISABLE="{$TOUCHPAD $KEYBOARD $TRACKPOINT}"

echo "\nscreen: $SCREEN"

echo "\n*** Devices to rotate ***\nstylus: $STYLUS\nfinger: $FINGER\neraser: $ERASER"

echo "\n*** Devices to block ***\ntouchpad: $TOUCHPAD\nkeyboard: $KEYBOARD\ntrackpoint: $TRACKPOINT"

sed -e "s/\$1/$SCREEN/g" \
    -e "s/\$2/$IDS_TO_ROTATE/g" \
    -e "s/\$3/$IDS_TO_DISABLE/g" \
    screenrotator.in > screenrotator

chmod +x screenrotator
