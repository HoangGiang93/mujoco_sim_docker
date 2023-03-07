# mujoco_sim_docker

This repository contains docker images for deploying ROS packages for MuJoCo with https://github.com/K4R-IAI/K4R_Development.git

### 0. Prerequisites: https://docs.docker.com/desktop/install/ubuntu/

No ROS required, No Unreal Engine required, just a PC with a good NVIDIA Graphic Card :)

Check your docker-compose and docker-py versions:

```bash
$ docker -v
Docker version 20.10.23, build 7155243
$ docker compose version
Docker Compose version v2.15.1
```

### 1. If you want to use a package simulator from Unreal Engine, download it [here](https://seafile.zfn.uni-bremen.de/f/1495a220141d4fbda943/) and unzip it

### 2. Clone this repository and go into the checked out folder:

```
cd mujoco_sim_docker
```

### 3. Follow these steps to build docker images:

#### 3.1. Clone the packages with wstool

```
sudo apt install ros-${ROS_DISTRO}-mk # Install mk from rospack
sudo apt install python3-wstool        # Install wstool
./setup_ros_packages.bash
```

#### 3.2. Install nvidia-docker2 to enable GPU access with Compose (sudo required)

```
./setup_rviz.bash
```

#### 3.3. Apply for a free academic license for Gurobi, see [Gurobi Academic Web License Service](https://www.gurobi.com/features/academic-wls-license/) for more information

##### 1) [Register for a free Gurobi account as an academic and log in.](https://pages.gurobi.com/registration)

##### 2) [Visit the Gurobi User Portal](https://portal.gurobi.com/iam/licenses/request?type=academic)

##### 3) Request and download your Academic WLS License

##### 4) Move your licencse `gurobi.lic` in `images/giskard-ws-image` folder

**Note:** Your computer must be connected to a recognized academic institution network when the request is made. Your WLS license will be valid for 90 days and is renewable for as long as you maintain eligibility.

#### 3.4. Build the docker images

```
source .env # This step is to make sure the ROS_DISTRO is noetic
docker compose build
```

### 4. Using the docker images

#### 4.1. Start `ros-core-servce` and `mujoco-ws-service`

```
docker compose up mujoco-ws-service
```

#### 4.2. Start the simulation (either by clicking Play in Unreal Engine or from the unziped package)

```
sh K4R_Development.sh
```

#### 4.3. You can visualize everything with rviz from docker container

```
./run_rviz.bash
```

The result should look like this:

![Result](https://user-images.githubusercontent.com/64316740/219008496-0ea4cec0-4752-411f-8d3c-de5ca28bdc50.png)

### 5. Connect to docker container via ROS

```
export ROS_MASTER_URI=http://192.168.75.2:11311
export ROS_IP=$(hostname -I | awk '{print $1}') #your IP
```

### 6. Stop docker containers

#### 6.1. Cancel every terminals with Ctrl + C

#### 6.2. Remove docker containers and network

```
docker compose down
```
