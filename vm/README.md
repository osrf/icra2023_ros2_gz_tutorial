# Virtual Machine
This tutorial explains how to install ROS 2 and Gazebo in a virtual machine using
VMWare Fusion 13. This is suitable for Mac computers (both Intel and M1). These
instructions are tested on an M1 Macbook Pro 14 running macOS Ventura.

## (Preferred) Install From USB Stick at ICRA
1. Install VMware Fusion Player 13.
- Go to the VMware Fusion Player [download
  website](https://customerconnect.vmware.com/evalcenter?p=fusion-player-personal-13).
- Under "License and Download", create an account and apply for a personal
  license.
- Return to the [download
  website](https://customerconnect.vmware.com/evalcenter?p=fusion-player-personal-13),
  log in with your new account, and manually download the VMWare Fusion Player
  with a Personal Use License.
- Double-click "VMware-Fusion-13.0.2-21581413_universal.dmg" and proceed with
  licensing and installation.

2. Copy the VMBundle containing Ubuntu Jammy 22.04, ROS Humble, and Gazebo
   Garden onto your machine from a USB drive. If it is compressed, unzip it.

3. Create a VMware Fusion virtual machine using this VMBundle by double clicking
   its icon in Finder.

4. Log in using username `dev` and password `dev`.

5. Enjoy the tutorial! This VM has ROS2 Humble, Gazebo Garden, ROS2
   Documentation, and MoveIt 2 pre-installed.

## (Alternative) Install Yourself via Internet
If you have access to fast internet and have time to compile and install
software, you can prepare a virtual machine yourself. We ask that in-person
participants instead use the provided USB sticks in order to conserve bandwidth
at the conference venue.
<details>
  <summary>View description of bandwidth-intensive installation process.</summary>
  
1. Install VMWare Fusion Player 13.
- Go to the [download
  website](https://customerconnect.vmware.com/evalcenter?p=fusion-player-personal-13).
- Under "License and Download", create an account and apply for a personal
  license.
- Return to the [download
  website](https://customerconnect.vmware.com/evalcenter?p=fusion-player-personal-13),
  log in with your new account, and manually download the VMWare Fusion Player
  with a Personal Use License.
- Double-click "VMware-Fusion-13.0.2-21581413_universal.dmg" and proceed with
  licensing and installation.
2. Install Ubuntu, ROS2, and Gazebo in a VM.
- Install Ubuntu ARM64 Server from an officially downloaded ISO.
- Select 15GB for "/" drive.
- Follow the instructions
  [here](https://dev.to/daud99/installing-ubuntu-using-vmware-fusion-tech-preview-on-mac-m1-silicon-4b0e)
  to install ubuntu-desktop in the Ubuntu server environment.
- Complete the `RUN` commands from the [tutorial
  Dockerfile](../docker/icra2023_tutorial/Dockerfile) to install ROS2 Humble,
  Gazebo Garden, and many important libraries and documentation sources. Some
  modification may be necessary to suit an interactive workflow.
</details>