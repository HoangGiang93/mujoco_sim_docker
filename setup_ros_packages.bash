#!/bin/bash
CURRENT_DIR=${PWD}
cd ${CURRENT_DIR}/images/mujoco-ws-image/src
wstool update 
cd ${CURRENT_DIR}/images/mujoco-ws-image/src/mujoco_sim
make

cd ${CURRENT_DIR}/images/giskard-ws-image/src
wstool update
cd ${CURRENT_DIR}/images/giskard-ws-image
make