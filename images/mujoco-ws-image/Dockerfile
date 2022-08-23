ARG ROS_DISTRO
FROM ros:${ROS_DISTRO}-robot

COPY src /home/mujoco_ws/src

# Install prerequisites
WORKDIR /home/mujoco_ws
RUN apt-get update && apt-get install -y \
  apt-utils \
  ros-${ROS_DISTRO}-gripper-action-controller \
  ros-${ROS_DISTRO}-rosbridge-suite \
  ros-${ROS_DISTRO}-move-base \
  ros-${ROS_DISTRO}-map-server \
  ros-${ROS_DISTRO}-dwa-local-planner \
  python3-pip \
  python3-dev \
  python3-catkin-tools \
  libglfw3 \
  libglfw3-dev \
  doxygen
RUN rosdep install --from-paths src --ignore-src -r -y \
  && rm -rf /var/lib/apt/lists/*

# Build catkin workspace
RUN . /opt/ros/${ROS_DISTRO}/setup.sh && catkin build

# Create entrypoint
SHELL ["/bin/bash", "-c"]
COPY ./entrypoint.bash /entrypoint.bash
RUN chmod +x /entrypoint.bash