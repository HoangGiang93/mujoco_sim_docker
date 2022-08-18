#!/bin/bash
xhost +local:root
docker-compose up rviz

# cleanup after rviz has been closed
xhost -local:root