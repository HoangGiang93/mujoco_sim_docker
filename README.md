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

![BoxDocker](https://user-images.githubusercontent.com/64316740/236650006-1596fbbb-8efd-413c-80a4-df24f4017e96.png)

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

The generated knowledge graph and all relevant data can be found at 
`images/mujoco-ws-image/src/mujoco_sim/model/save`

##### 5. Test with reasoner, Protege for example

![image](https://user-images.githubusercontent.com/64316740/236653496-71307154-4c00-4da6-93ff-73270b9430a5.png)

##### 6. Stop docker containers

###### 6.1. Cancel every terminals with Ctrl + C

###### 6.2. Remove docker containers and network

```
docker compose down
```
