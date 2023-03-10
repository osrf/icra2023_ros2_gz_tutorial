Docker environments to run the tutorials in this repository.

## Prerequisites

If your machine has an NVIDIA GPU, install Docker and NVIDIA Docker 2 following
instructions [here](https://github.com/osrf/subt/wiki/Docker%20Install).

If you don't have an NVIDIA GPU, Gazebo GUI will use software rendering via
Mesa llvmpipe (you can check that in ~/.gz/rendering/ogre2.log after starting
the Gazebo GUI).

## Example usage

To build an image:

If you have an NVIDIA graphics card, build using the NVIDIA Docker base image:
```
./build.bash icra2023_tutorial
```
Otherwise, build without NVIDIA Docker:
```
./build.bash icra2023_tutorial --no-nvidia
```

To spin up a container from an image:
```
./run.bash icra2023_tutorial
```

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

# xauth permission denied

If you get the following printout after executing `run.bash`, but the GUIs still
work for you, you can ignore the messages.
```
xauth:  /tmp/.docker.xauth not writable, changes will be ignored
xauth: (argv):1:  unable to read any entries from file "(stdin)"
chmod: changing permissions of '/tmp/.docker.xauth': Operation not permitted
```

If they don't work, you can also try the following on the host machine:
```
xhost + local:
```
