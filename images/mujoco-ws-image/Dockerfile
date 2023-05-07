ARG ROS_DISTRO
FROM ros:${ROS_DISTRO}-robot

# Zero interaction while installing or upgrading the system via apt, see https://bobcares.com/blog/debian_frontendnoninteractive-docker/
ARG DEBIAN_FRONTEND=noninteractive 

# Install prerequisites 
RUN apt-get update && apt-get install -y \
  python3-pip \
  python3-dev \
  python3-catkin-tools \
  libglfw3 \
  libglfw3-dev \
  doxygen \
  git \
  libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev libxt-dev \
  ros-${ROS_DISTRO}-joint-state-controller \
  ros-${ROS_DISTRO}-joint-state-publisher-gui \
  ros-${ROS_DISTRO}-effort-controllers

RUN pip3 install pyside6 pyopengl mujoco wheel Cython owlready2 
RUN cd /home && git clone https://github.com/HoangGiang93/USD.git --branch UsdOntology
RUN cd /home/USD/build_scripts/ && python3 build_usd.py install

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