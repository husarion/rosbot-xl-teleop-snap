# rosbot-xl-teleop-snap

The rosbot-xl teleop snap allows for teleoperating the robot from either the keyboard,
a gamepad or leave it to the navigation stack.

[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/rosbot-xl-teleop)

## Installation

Install the snap as follows,

```bash
snap install rosbot-xl-teleop
```

## Setup

Upon installation, depending on your operating system,
you may have to manually connect the snap interface.
You can verify that with the following command,

```bash
$ snap connections rosbot-xl-teleop
Interface            Plug                               Slot                            Notes
content[ros-humble]  rosbot-xl-teleop:ros-humble        ros-humble-ros-base:ros-humble  manual
hardware-observe     rosbot-xl-teleop:hardware-observe  -                               -
joystick             rosbot-xl-teleop:joystick          -                               -
network              rosbot-xl-teleop:network           :network                        -
network-bind         rosbot-xl-teleop:network-bind      :network-bind                   -

```

The interface `ros-humble` must be connected.

If it isn't, you can issue the following command,

```bash
snap connect rosbot-xl-teleop:ros-humble ros-humble-ros-base
```

Similarly the interfaces `hardware-observe` and `joystick` can be respectively connected with,

```bash
snap connect rosbot-xl-teleop:hardware-observe
snap connect rosbot-xl-teleop:joystick
```

## Use

### Joy

The snap offers the possibility to teleoperate the robot from a joystick,

```bash
rosbot-xl-teleop.joy
```

This app launches both the gamepad driver as well as the joy teleop node.
The default configuration is that of a [Logitech F710](https://www.logitechg.com/en-us/products/gamepads/f710-wireless-gamepad.html) with:

- top left trigger for enablement
- left joystick for for/backward
- right joystick for rotation

The joy teleop node's configuration file can be found at `$SNAP_COMMON/config/joy_teleop.config.yaml` and can thus be edited.
Shall you want to reinitialise it,
you can simply issue the command `rosbot-xl-teleop.reset-config`.

### Key

The robot can also be teleoperated from a keyboard (e.g. through SSH) with,

```bash
rosbot-xl-teleop.key
```

### Mux

The snap makes use of a topic multiplexer to switch from one source to another.
Its input topic can be selected as,

```bash
rosbot-xl-teleop.mux-select <topic>
```

Note that when launching the `joy` or `key` app,
the appropriate topic is automatically selected.

> **Note**
> This snap is part of an integrated snaps deployment.
>
> Other recommended snaps to be installed are,
>
> - [micro-xrce-dds-agent](LINK)
> - [sllidar-ros2](https://snapcraft.io/sllidar-ros2)
> - [rosbot-xl-teleop](https://snapcraft.io/rosbot-xl-teleop)
> - [rosbot-xl-nav](https://snapcraft.io/rosbot-xl-nav)
