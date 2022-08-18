ARG ROS_DISTRO
FROM ros:${ROS_DISTRO}-robot

# Install prerequisites
RUN apt-get update && apt-get install -y \
  apt-utils \
  && rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-c"]
COPY ./entrypoint.bash /entrypoint.bash
RUN chmod +x /entrypoint.bash