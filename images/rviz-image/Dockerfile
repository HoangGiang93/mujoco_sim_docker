ARG ROS_DISTRO
FROM mujoco-ws:${ROS_DISTRO}

# Zero interaction while installing or upgrading the system via apt, see https://bobcares.com/blog/debian_frontendnoninteractive-docker/
ARG DEBIAN_FRONTEND=noninteractive 

# Install prerequisites
WORKDIR /home/mujoco_ws
RUN apt-get update && apt-get install -y \
  ros-${ROS_DISTRO}-rviz
RUN rm -rf /var/lib/apt/lists/*

# Create entrypoint
SHELL ["/bin/bash", "-c"]
COPY ./entrypoint.bash /entrypoint.bash
RUN chmod +x /entrypoint.bash