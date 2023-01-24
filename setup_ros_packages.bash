#!/bin/bash
cd images/mujoco-ws-image/src
wstool update
cd mujoco_sim
make

cd images/giskard-ws-image/src
wstool update
cd ../
make