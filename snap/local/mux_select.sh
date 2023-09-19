#!/usr/bin/bash -e

if [[ $# < 1 ]]; then
  echo "usage: ./mux_select <topic>"
fi

# Add leading slash if missing
TOPIC=$(echo $1 | sed '/^\//! s/^/\//')

# BIN_PATH="${SNAP}/opt/ros/underlay_ws/opt/ros/${ROS_DISTRO}/bin"

# ${BIN_PATH}/
ros2 service call /mux/select topic_tools_interfaces/srv/MuxSelect "{topic: ${TOPIC}}"
