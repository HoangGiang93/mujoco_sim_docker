# mujoco_sim_docker

This repository contains docker images for deploying ROS packages for MuJoCo with https://github.com/K4R-IAI/K4R_Development

### 0. Prerequisites: https://docs.docker.com/compose/install
No ROS required, No Unreal Engine required, just a PC with a good NVIDIA Graphic Card :)

Check your docker-compose and docker-py versions:
```bash
$ docker-compose -v
docker-compose version 1.29.2, build 5becea4c
$ pip3 freeze | grep docker
docker==5.0.0
```

### 1. If you want to use a package simulator from Unreal Engine, download it at https://seafile.zfn.uni-bremen.de/f/aa015a071cb7498695a7/ and unzip it
### 2. Clone this repository and go into docker folder
```
cd docker
```
### 3. Follow these steps to build docker images:
#### 3.1. Clone the packages with wstool
```
./setup_ros_packages.bash
```
#### 3.2. Install nvidia-docker2 to enable GPU access with Compose (sudo required)
```
./setup_rviz.bash
```
#### 3.3. Build the docker images
```
docker-compose build
```
### 4. Using the docker images
#### 4.1. Start ros-core and mujoco-ws
```
docker-compose up mujoco-ws
```
#### 4.2. Start the simulation (either by clicking Play in Unreal Engine or from the unziped package)
```
sh Waterfront.sh
```
#### 4.3. You can visualize everything with rviz from docker container
```
./run_rviz.bash
```
The result should look like this:

![Result](https://user-images.githubusercontent.com/64316740/186185620-31dcf285-ba90-4476-a28f-24734854b2fc.png)
### 5. Stop docker containers 
#### 5.1. Cancel every terminals with Ctrl + C
#### 5.2. Remove docker containers and network
```
docker-compose down
```
