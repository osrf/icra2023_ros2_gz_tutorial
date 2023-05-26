# Docker environments to run the tutorials in this repository

These instructions were tested on Ubuntu Jammy (22.04). Other recent versions
should work as well.

## Prerequisites

These instructions do not work on M1 Macs. If you have an M1 Mac, consider using
the [VM instructions](../vm/README.md) or working with someone who does not.

Before starting, please ensure that Docker is installed and configured on your
system by following the instructions
[here](https://github.com/osrf/subt/wiki/Docker%20Install).

While following the instructions, please add your user account to the docker
group in order to avoid permission issues by following the instructions under
the Troubleshooting section
[here](https://github.com/osrf/subt/wiki/Docker%20Install#troubleshooting).

If your machine has an NVIDIA GPU, make sure to also install NVIDIA Docker 2
following the instructions
[here](https://github.com/osrf/subt/wiki/Docker%20Install#install-nvidia-docker).

If you don't have an NVIDIA GPU, Gazebo GUI will use software rendering via
Mesa llvmpipe (you can check that in `~/.gz/rendering/ogre2.log` after starting
the Gazebo GUI).

## Option 1: Pull from DockerHub (recommended)

This is the easiest way to get set up and running.

The image in this directory, along with 3D models used in the tutorial, is
built and pushed to DockerHub under
[osrf/icra2023_ros2_gz_tutorial](https://hub.docker.com/r/osrf/icra2023_ros2_gz_tutorial/tags).

You can pull it from DockerHub:
```
docker pull osrf/icra2023_ros2_gz_tutorial:<tag>
```
Replace `<tag>` with `tutorial_nvidia` or `tutorial_no_nvidia`, depending on whether you
have an NVIDIA GPU.

## Option 2: Build the image locally

Skip this step if you already pulled the image from DockerHub.

This builds the image from scratch. This gives you a working environment, but
it does not contain some extra data that we included in the images on DockerHub
intended to make parts of the tutorial possible without WiFi.

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

## Option 3: Load the image from a file

Skip this step if you already pulled the image from DockerHub, or if you built
the image locally.

If the two options above fail for you, you may be given a compressed file
(e.g. on the day of the tutorial, but please try the two options above first).

You can load the file as a Docker image, e.g.
```
docker load < file.tar.gz
```

This should be quick, but of course depends on your machine specifications
(took 1 minute from internal SSD on Dell XPS 15 9570 from 2018).

## Run the image

To spin up a container from an image, this should work whether you pulled from
DockerHub or built locally:
```
# If you have NVIDIA GPU
./run.bash osrf/icra2023_ros2_gz_tutorial:tutorial_nvidia

# Without NVIDIA GPU
./run.bash osrf/icra2023_ros2_gz_tutorial:tutorial_no_nvidia --no-nvidia
```

For convenience, if you built the image locally, this is an equivalent command
that you can tab-complete:
```
./run.bash icra2023_tutorial
# Or
./run.bash icra2023_tutorial --no-nvidia
```

You can see the list of all images with
```
docker images
```

You can set up an alias so that you don't have to type the command every time.
For example, replace the path and image name to yours:
```
alias run_osrf_icra="/absolute/path/to/run.bash osrf/icra2023_ros2_gz_tutorial:tutorial_nvidia"
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

### ROS 2 Humble and Gazebo Garden interoperability

For the purpose of the ICRA tutorial, we set up ROS 2 and Gazebo separately,
since they are run as two separate tutorials.
This allows us to show you the latest versions of each at the time of writing
(ROS 2 Humble and Gazebo Garden).
We do not intend to use both at the same time for the tutorial.

It is possible to use Humble and Garden together, and we have real-world
projects that do, though that is not a recommended combination.

You will need to build the interface stack
[`ros_gz`](https://github.com/gazebosim/ros_gz) from source.

Then, make sure to export this environment variable:
```
export GZ_VERSION=garden
```

For details, see Gazebo documentation on
[Installing Gazebo with ROS](https://gazebosim.org/docs/garden/ros_installation).

## For maintainers

### For maintainers building image for DockerHub

To speed up load time of Gazebo worlds containing large 3D models from Fuel
(e.g. on tutorial day), you can burn the Fuel data into the image ahead of time.

Follow the section below to run the image, then launch Gazebo with your desired
worlds (for splash screen worlds, simply run `gz sim` and select the worlds
from the splash screen).

The models may take a while to download from Fuel, while the Gazebo window
remains black. Once the world is loaded, close Gazebo.

Repeat for each world desired.

Outside the container, on the host machine, copy the data out from the Docker
container, to this directory (`./fuel`):
```
docker cp trusting_albattani:/home/developer/.gz/fuel fuel
```

Then rebuild the image as above.
Now the image will contain all the Fuel models of the Gazebo worlds you loaded.
Next time you run the image, it will not need to download the Fuel data (unless
a new version of a model becomes available).

### For maintainers only: Push to DockerHub

Skip this section if you are not a maintainer of this repository.

To push to DockerHub, make sure you have built both tags, then run
```
docker login
docker push osrf/icra2023_ros2_gz_tutorial:tutorial_nvidia
docker push osrf/icra2023_ros2_gz_tutorial:tutorial_no_nvidia
```

### For maintainers only: Save Docker image to disk

You may want to save the compiled Docker image to disk, e.g. on a USB drive.

This will take a few minutes (gzip option to internal SSD took 5 minutes on
Dell XPS 15 9570 from 2018).

You can use gzip (file size much smaller than tar):
```
docker save osrf/icra2023_ros2_gz_tutorial:tutorial_nvidia | gzip > tutorial_nvidia.tar.gz
docker save osrf/icra2023_ros2_gz_tutorial:tutorial_no_nvidia | gzip > tutorial_no_nvidia.tar.gz
```

To load the file back into Docker as an image, use `docker load` as described
in a section above.
