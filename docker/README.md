Docker environments to run the tutorials in this repository.

## Prerequisites

Install Docker and NVIDIA Docker 2 (if your machine has an NVIDIA GPU) following
instructions [here](https://github.com/osrf/subt/wiki/Docker%20Install).

## Example usage

To build an image:
```
./build.bash icra2023_tutorial_nvidia
```

To spin up a container from an image:
```
./run.bash icra2023_tutorial_nvidia
```

To join a running container from another terminal:
```
./join.bash icra2023_tutorial_nvidia
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
```

Gazebo:
```
gz sim
```
The Gazebo GUI should show up.

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
