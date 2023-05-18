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

IMG=$(basename $1)
# Use quotes if image name contains symbols like a forward slash /, but then
# cannot use `basename`.
#IMG="$1"

# If the user is not in the docker group, run the docker command with sudo
if [[ $(grep /etc/group -e "docker") == *"${USER}"* ]]; then
  DOCKER_CMD_PREFIX=""
else
  DOCKER_CMD_PREFIX="sudo"
fi

xhost +
containerid=$(docker ps -aqf "ancestor=${IMG}")
${DOCKER_CMD_PREFIX} docker exec --privileged -e DISPLAY=${DISPLAY} -e LINES=`tput lines` -it ${containerid} bash
xhost -
