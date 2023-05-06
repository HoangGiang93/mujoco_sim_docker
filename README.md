# mujoco_sim_docker

This repository contains docker images for deploying ROS packages for MuJoCo

### 0. Prerequisites: https://docs.docker.com/desktop/install/ubuntu/

No ROS required, just a PC :)

Check your docker-compose and docker-py versions:

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
./setup_rviz.bash
```

##### 3. Using the docker compose

```
./run_mujoco.bash
```

The result should look like this:

##### 4. Spawn the cat (optional) and generate the knowledge graph

###### 4.1. Get inside a container

```
docker exec -it mujoco-ws-service bash
```

###### 4.2. Spawn the cat at random position (optional)

```
source devel/setup.bash
rosrun mujoco_sim spawn_cat.py
```

###### 4.3 Generate the knowledge graph

```
roslaunch mujoco_sim SceneCapture.launch
```

The knowledge graph can be found at 
`images/mujoco-ws-image/src/mujoco_sim/model/save`

##### 5. Stop docker containers

###### 5.1. Cancel every terminals with Ctrl + C

###### 5.2. Remove docker containers and network

```
docker compose down
```
