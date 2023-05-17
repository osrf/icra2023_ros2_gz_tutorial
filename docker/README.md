# Docker environments to run the tutorials in this repository

## Prerequisites

If your machine has an NVIDIA GPU, install Docker and NVIDIA Docker 2 following
instructions [here](https://github.com/osrf/subt/wiki/Docker%20Install).

If you don't have an NVIDIA GPU, Gazebo GUI will use software rendering via
Mesa llvmpipe (you can check that in ~/.gz/rendering/ogre2.log after starting
the Gazebo GUI).

## Pull from DockerHub

This image (and possibly some extra data) is built and pushed to DockerHub under
[osrf/icra2023_ros2_gz_tutorial](https://hub.docker.com/r/osrf/icra2023_ros2_gz_tutorial/tags).

You can pull it from DockerHub and skip building it locally:
```
docker pull osrf/icra2023_ros2_gz_tutorial:<tag>
```
Replace `<tag>` with `tutorial_nvidia` or `tutorial_no_nvidia`, depending on whether you
have an NVIDIA GPU.

## Build the image locally

Skip this step if you already pulled the image from DockerHub.

If you have an NVIDIA graphics card, build using the NVIDIA Docker base image:
```
./build.bash nvidia_opengl_ubuntu22
./build.bash icra2023_tutorial
```

Otherwise, build without NVIDIA Docker:
```
./build.bash icra2023_tutorial --no-nvidia
```

A few tags will be created for the same image, for convenience of running
commands.

## Run the image

To spin up a container from an image, this should work whether you pulled from
DockerHub or built locally:
```
# If you have NVIDIA GPU
./run.bash osrf/icra2023_ros2_gz_tutorial:tutorial_nvidia

# Without NVIDIA GPU
./run.bash osrf/icra2023_ros2_gz_tutorial:tutorial_no_nvidia --no-nvidia
```

If you built the image locally, this is a shorter, equivalent command:
```
./run.bash icra2023_tutorial
```

## Open another terminal in the running container

To join a running container from another terminal:
```
./join.bash icra2023_tutorial
```

## Test the image

After building and running the image, try the following commands inside the
container.

ROS 2:
```
$ . /opt/ros/humble/setup.bash
$ ros2 topic list
/parameter_events
/rosout
$ rviz2
```
The RViz GUI should show up.

Gazebo:
```
gz sim
```
The Gazebo GUI should show up.

## Look at ROS 2 documentation locally

The ROS 2 documentaion is built locally in the Dockerfile.

Open a web browser and go to `localhost:9090`. You should see the documentation
site.

## Docker cheat sheet

To list all images built:
```
docker images
```

To remove an image:
```
docker image rm <IMAGE ID>
```

To untag an image (if this is the only tag for the IMAGE ID, the image will be
removed):
```
docker image rmi <REPOSITORY:TAG>
```

## Troubleshoot

### xauth permission denied

If you get the following printout after executing `run.bash`, but the GUIs still
work for you, you can ignore the messages.
```
xauth:  /tmp/.docker.xauth not writable, changes will be ignored
xauth: (argv):1:  unable to read any entries from file "(stdin)"
chmod: changing permissions of '/tmp/.docker.xauth': Operation not permitted
```

If GUI programs don't work, you can also try the following on the host machine:
```
xhost + local:
```
