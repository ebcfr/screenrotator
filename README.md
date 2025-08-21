# A screen rotator

## What it is

A small utility that creates an icon in the systray and handles events from the accelerometer on Laptops with a tablet mode for desktop environments that don't handle it.

It uses DBus to access accelerometer data and controls automatically the rotation of the screen and of the pen and finger tip coordinantes.

On some PC, the tablet mode des not disable the keyboard/touchpad/trackpoint. So you may configure the program to disable these devices.

By default, the screen is in normal mode and all the devices are enabled. Physically rotating the screen will generate `normal`, `left-up`, `right-up` or `bottom-up` events. If one of the 3 last events are generated, the display is rotated, the pen and finger tip coordiantes are upated accordingly, and the keyboard/touchapad/trackpoint are disabled.

Back to `normal`, all the devices are enabled. If the lid is closed, all the devices are enabled.

An icon menu allows to disable the automatic rotation. When disabled, the rotation is still available using the Rotate menu item. The rotation is then on demand.

## Configuration

**Before installing the program**, run the screenrotator config script

```
./config.sh
```

It uses

```
xrandr
xinput
```

to get the laptop default screen identifier, an input device id list for devices which the coordinate system must turn, and for the devices that must be disabled when the screen is rotated. and creates the `screenrotator̀ from `screenrotator.in` .

 
## Install

The following package are required
- tcl9 tl9
- tcl-dbus, to allow tcl access DBus: https://chiselapp.com/user/schelte/repository/dbus
- iir-sensor-proxy, to make the accelerometer connect to DBus: https://gitlab.freedesktop.org/hadess/iio-sensor-proxy/

**Configure the screen, devices to rotate and to disable!**

```
# install
chmod +x screenrotator
sudo cp screenrotator /usr/local/bin/
screenrotator

# to autostart the screen rotator
sudo cp screenrotator-autostart.desktop /etc/xdg/autostart/

## Tcl and DBus


