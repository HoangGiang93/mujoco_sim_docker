ARG ROS_DISTRO
FROM ros-core:${ROS_DISTRO}

# Zero interaction while installing or upgrading the system via apt, see https://bobcares.com/blog/debian_frontendnoninteractive-docker/
ARG DEBIAN_FRONTEND=noninteractive 

# Install prerequisites 
RUN apt-get update && apt-get install -y \
  ros-${ROS_DISTRO}-gripper-action-controller \
  ros-${ROS_DISTRO}-rosbridge-suite \
  ros-${ROS_DISTRO}-move-base \
  ros-${ROS_DISTRO}-amcl \
  ros-${ROS_DISTRO}-map-server \
  ros-${ROS_DISTRO}-dwa-local-planner \
  ros-${ROS_DISTRO}-hector-gazebo-plugins \
  ros-${ROS_DISTRO}-gazebo-ros-control \
  ros-${ROS_DISTRO}-rtabmap-ros \
  python3-pip \
  python3-dev \
  python3-catkin-tools \
  libglfw3 \
  libglfw3-dev \
  doxygen

# Copy pacakges
COPY src /home/mujoco_ws/src
WORKDIR /home/mujoco_ws

# Build catkin workspace
RUN rosdep install --from-paths src --ignore-src -r -y \
  && rm -rf /var/lib/apt/lists/*
RUN . /opt/ros/${ROS_DISTRO}/setup.sh && catkin build

# Create entrypoint
SHELL ["/bin/bash", "-c"]
COPY ./entrypoint.bash /entrypoint.bash
RUN chmod +x /entrypoint.bash