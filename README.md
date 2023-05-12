# mujoco_sim_docker

This repository contains docker images for deploying ROS packages for MuJoCo

### 0. Prerequisites: https://docs.docker.com/desktop/install/ubuntu/

No ROS required, just a PC :)

Check your docker and docker compose versions:

```bash
$ docker -v
Docker version 23.0.5, build bc4487a
$ docker compose version
Docker Compose version v2.17.3
```

##### 1. Clone this repository and go into the checked out folder:

```
cd mujoco_sim_docker
```

##### 2. Install nvidia-docker2 to enable GPU access with Compose (sudo required)

```
./setup_nvidia_docker.bash
```

##### 3. Using the docker compose

```
./run_mujoco.bash
```

The result should look like this:

![Result](https://github.com/HoangGiang93/mujoco_sim_docker/assets/64316740/34154b23-2628-41e3-b01a-bdd43585263c)

##### 4. Stop docker containers

###### 4.1. Cancel every terminals with Ctrl + C

###### 4.2. Remove docker containers and network

```
docker compose down
```
