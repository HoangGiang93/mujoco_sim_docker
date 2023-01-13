# mujoco_sim_docker

This repository contains docker images for deploying ROS packages for MuJoCo with https://github.com/code-iai/UnrealApartment/tree/AddHSR

### 0. Prerequisites: https://docs.docker.com/compose/install
No ROS required, No Unreal Engine required, just a PC with a good NVIDIA Graphic Card :)

Check your docker-compose and docker-py versions:
```bash
$ docker-compose -v
docker-compose version 1.29.2, build 5becea4c
$ pip3 freeze | grep docker
docker==5.0.0
```

### 1. If you want to use a package simulator from Unreal Engine, download it [here](https://seafile.zfn.uni-bremen.de/f/1082308fd7724dd5a8c9/) and unzip it
### 2. Clone this repository and go into the checked out folder:
```
cd mujoco_sim_docker
```
### 3. Follow these steps to build docker images:
#### 3.1. Clone the packages with wstool
```
sudo apt install ros-${ROS_DISTRO}-mk # This step is to make sure the mk from rospack is there
./setup_ros_packages.bash
```
#### 3.2. Install nvidia-docker2 to enable GPU access with Compose (sudo required)
```
./setup_rviz.bash
```
#### 3.3. Build the docker images
```
source .env # This step is to make sure the ROS_DISTRO is noetic
docker-compose build
```
### 4. Using the docker images
#### 4.1. Start ros-core and mujoco-ws
```
docker-compose up mujoco-ws
```
#### 4.2. Start the simulation (either by clicking Play in Unreal Engine or from the unziped package)
```
sh Laborraum.sh
```
#### 4.3. You can visualize everything with rviz from docker container
```
./run_rviz.bash
```
The result should look like this:

![Result](https://user-images.githubusercontent.com/64316740/207082423-ae6843c2-8145-42b9-8d8b-09b71b94137f.png)

### 5. Connect to docker container via ROS
```
export ROS_MASTER_URI=http://192.168.75.2:11311
export ROS_IP=$(hostname -I | awk '{print $1}') #your IP
```

### 6. Stop docker containers 
#### 6.1. Cancel every terminals with Ctrl + C
#### 6.2. Remove docker containers and network
```
docker-compose down
```
