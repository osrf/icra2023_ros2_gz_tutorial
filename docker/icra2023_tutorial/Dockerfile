#
# Copyright (C) 2023 Open Source Robotics Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# ROS 2 Humble binary install
# http://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html

# Gazebo Garden binary install
# https://gazebosim.org/docs/garden/install_ubuntu

# Ubuntu with nvidia-docker2 beta opengl support
# https://hub.docker.com/r/nvidia/opengl
# doesn't exist for Ubuntu 22.04 yet at time of writing.
#FROM nvidia/opengl:1.0-glvnd-devel-ubuntu22.04
# Use homebrewed version until above exists officially
# Image is in ../nvidia_opengl_ubuntu22/Dockerfile
#FROM nvidia_opengl_ubuntu22:latest
# Base image. NVIDIA or no-NVIDIA.
ARG base
FROM ${base}

# This avoids keyboard interaction when asked for geographic area
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y \
        build-essential \
        cmake \
        cppcheck \
        curl \
        doxygen \
        gdb \
        git \
        gnupg2 \
        libbluetooth-dev \
        libcwiid-dev \
        libgoogle-glog-dev \
        libspnav-dev \
        libusb-dev \
        locales \
        lsb-release \
        mercurial \
        python3-dbg \
        python3-empy \
        python3-numpy \
        python3-pip \
        python3-psutil \
        python3-venv \
        software-properties-common \
        sudo \
        tzdata \
        vim \
        wget \
        curl \
 && apt-get clean

# Set Locale for ROS 2
RUN locale-gen en_US en_US.UTF-8 && \
  update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
  export LANG=en_US.UTF-8

# Add ROS 2 apt repository
# Set up keys
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
# Set up sources.list
RUN sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'

RUN export DEBIAN_FRONTEND=noninteractive

# Install ROS 2, Gazebo, and build tools
# https://colcon.readthedocs.io/en/released/user/installation.html
RUN /bin/sh -c 'wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg' \
 && /bin/sh -c 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null' \
 && apt-get update \
 && apt-get install -y \
    python3-rosdep \
    python3-vcstool \
    python3-colcon-common-extensions \
    python3-colcon-mixin \
    ros-humble-control-msgs \
    ros-humble-controller-manager \
    ros-humble-desktop \
    ros-humble-generate-parameter-library \
    ros-humble-geometric-shapes \
    ros-humble-gripper-controllers \
    ros-humble-joint-state-broadcaster \
    ros-humble-joint-state-publisher \
    ros-humble-joint-trajectory-controller \
    ros-humble-moveit-common \
    ros-humble-moveit-configs-utils \
    ros-humble-moveit-core \
    ros-humble-moveit-hybrid-planning \
    ros-humble-moveit-msgs \
    ros-humble-moveit-resources-panda-moveit-config \
    ros-humble-moveit-ros-move-group \
    ros-humble-moveit-ros-perception \
    ros-humble-moveit-ros-planning \
    ros-humble-moveit-ros-planning-interface \
    ros-humble-moveit-ros-visualization \
    ros-humble-moveit-servo \
    ros-humble-moveit-visual-tools \
    ros-humble-moveit \
    ros-humble-rmw-cyclonedds-cpp \
    ros-humble-ros2-control \
    ros-humble-rviz-visual-tools \
    ros-humble-xacro \
    gz-garden \
 && apt-get clean

# Add a user with the same user_id as the user outside the container
# Requires a docker build argument `user_id`
ARG user_id
ENV USERNAME developer
RUN useradd -U --uid ${user_id} -ms /bin/bash $USERNAME \
 && echo "$USERNAME:$USERNAME" | chpasswd \
 && adduser $USERNAME sudo \
 && echo "$USERNAME ALL=NOPASSWD: ALL" >> /etc/sudoers.d/$USERNAME
# Commands below run as the developer user
USER $USERNAME
# When running a container start in the developer's home folder
WORKDIR /home/$USERNAME

# Initialize rosdep
RUN sudo rosdep init && rosdep update

# Add colcon mixins
RUN colcon mixin add default https://raw.githubusercontent.com/colcon/colcon-mixin-repository/master/index.yaml \
 && colcon mixin update default \
 && rm -rf log

# Optional: Build and install the ROS 2 documentation
RUN cd /home/$USERNAME && git clone https://github.com/ros2/ros2_documentation && cd ros2_documentation \
 && pip3 install -r requirements.txt -c constraints.txt && PATH=$PATH:/home/$USERNAME/.local/bin make multiversion \
 && mkdir /home/$USERNAME/docs.ros.org \
 && cp -av /home/$USERNAME/ros2_documentation/build/html/* /home/$USERNAME/docs.ros.org \
 && rm -rf /home/$USERNAME/ros2_documentation

RUN mkdir -p /home/$USERNAME/ws_moveit2/src \
 && cd /home/$USERNAME/ws_moveit2/src \
 && git clone https://github.com/ros-planning/moveit2_tutorials -b humble --depth 1 \
 && git clone https://github.com/ros-planning/moveit_task_constructor.git -b humble --depth 1

# Optional: Turtlebot 4
# NOTE rosdep install here pulls in Gazebo Fortress, on top of Gazebo Garden
# being installed in this Dockerfile.
RUN mkdir -p /home/$USERNAME/turtlebot4_ws/src \
 && cd /home/$USERNAME/turtlebot4_ws/src \
 && git clone https://github.com/turtlebot/turtlebot4_simulator.git -b humble \
 && cd /home/$USERNAME/turtlebot4_ws \
 && rosdep install --from-path /home/$USERNAME/turtlebot4_ws/src --ignore-src --rosdistro humble -y \
 && /bin/bash -c 'source /opt/ros/humble/setup.bash && colcon build --symlink-install'

# Optional: Copy Gazebo Fuel data from host if it exists, to speed up world
# loading time.
# Assumes Dockerfile is being built from a machine that has downloaded
# Fuel data to a directory ../fuel/ . Otherwise, no fuel data is included.
RUN mkdir -p "/home/$USERNAME/.gz/fuel"
# Note the weird spelling of "fuel" as the source; this is to only copy
# if the "fuel" directory exists (via Docker glob support).  See
# https://stackoverflow.com/questions/70096208/dockerfile-copy-folder-if-it-exists-conditional-copy/70096420#70096420
COPY --chown=$USERNAME build.bash fue[l] /home/$USERNAME/.gz/fuel
RUN rm -f build.bash

# Optional: Similarly, copy Turtlebot 4 Gazebo Fuel data from host (this is in
# ~/.ignition as opposed to ~/.gz because Turtlebot 4 runs in Gazebo Fortress).
RUN mkdir -p "/home/$USERNAME/.ignition/fuel"
COPY --chown=$USERNAME build.bash fuel_fortres[s] /home/$USERNAME/.ignition/fuel
RUN rm -f build.bash

# Start a webserver on localhost:9090 for the ROS 2 documentation, and drop to a bash shell
CMD ["/bin/bash", "-c", "pushd /home/$USERNAME/docs.ros.org && python3 -m http.server 9090 >& /dev/null & /bin/bash"]
