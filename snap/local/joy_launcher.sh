#!/usr/bin/bash -e

# Make sure the necessary interfaces are plugged.
for PLUG in hardware-observe joystick; do
  if ! snapctl is-connected ${PLUG}; then
    logger -t ${SNAP_NAME} "Plug '${PLUG}' isn't connected, please run: snap connect $SNAP_NAME:${PLUG} before running the 'joy' app."
    echo "Plug '${PLUG}' isn't connected, please run: snap connect $SNAP_NAME:${PLUG} before running the 'joy' app."
    exit 1
  fi
done

ROSBOT_XL_TELEOP_JOY_VEL_TOPIC="joy_vel"

if [[ -z "${ROSBOT_XL_TELEOP_JOY_PARAM_FILE}" ]]; then
  ROSBOT_XL_TELEOP_JOY_PARAM_FILE="$SNAP_COMMON/config/joy_teleop.config.yaml"
fi

# @todo(artivis) This actually has no effect and must be fixed in the teleop package
if [[ -z "${ROSBOT_XL_TELEOP_JOY_DEV}" ]]; then
  ROSBOT_XL_TELEOP_JOY_DEV="/dev/input/js0"
fi

$SNAP/ros2 launch teleop_twist_joy teleop-launch.py \
joy_vel:=${ROSBOT_XL_TELEOP_JOY_VEL_TOPIC} \
joy_dev:=${ROSBOT_XL_TELEOP_JOY_DEV} \
config_filepath:=${ROSBOT_XL_TELEOP_JOY_PARAM_FILE}
