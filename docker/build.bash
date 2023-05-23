#!/usr/bin/env bash

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
#

# Builds a Docker image.
# Example usage:
# If you have an NVIDIA graphics card
#   $ ./build.bash icra2023_tutorial
# Otherwise
#   $ ./build.bash icra2023_tutorial --no-nvidia

# No arg
if [ $# -eq 0 ]
then
    echo "Usage: $0 directory-name"
    exit 1
fi

# Get path to current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Default base image, defined in nvidia_opengl_ubuntu22/Dockerfile
base="nvidia_opengl_ubuntu22:latest"
tag_suffix="_nvidia"

# Parse and remove args
PARAMS=""
while (( "$#" )); do
  case "$1" in
    --no-nvidia)
      base="ubuntu:jammy"
      tag_suffix="_no_nvidia"
      shift
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done
# set positional arguments in their proper place
eval set -- "$PARAMS"

if [ ! -d $DIR/$1 ]
then
  echo "image-name must be a directory in the same folder as this script"
  exit 2
fi

user_id=$(id -u)
image_name=$(basename $1)

# Use same name as source directory so can tab-complete on run.bash
image_plus_tag=$image_name:latest

echo "Building $image_name with base image $base"
docker build --rm -t $image_plus_tag --build-arg base=$base --build-arg user_id=$user_id -f $DIR/$image_name/Dockerfile .
echo "Built $image_plus_tag"

# If building the tutorial image
if [[ "$image_name" == icra2023_tutorial ]]; then
  # DockerHub repo name
  repo_plus_tag_suffix="osrf/icra2023_ros2_gz_tutorial:tutorial$tag_suffix"
  docker tag $image_plus_tag $repo_plus_tag_suffix
  echo "Tagged as $repo_plus_tag_suffix"
fi
