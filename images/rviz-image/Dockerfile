ARG ROS_DISTRO
FROM mujoco-ws:${ROS_DISTRO}

# Install prerequisites
WORKDIR /home/mujoco_ws
RUN apt-get update && apt-get install -y \
  apt-utils \
  ros-${ROS_DISTRO}-rviz
RUN rm -rf /var/lib/apt/lists/*

# Create entrypoint
SHELL ["/bin/bash", "-c"]
COPY ./entrypoint.bash /entrypoint.bash
RUN chmod +x /entrypoint.bash