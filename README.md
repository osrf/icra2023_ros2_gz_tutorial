# Tutorial: "All about ROS 2 and the new Gazebo"

Thank you everyone for attending the in-person tutorial at ICRA 2023. We had a great turnout of 100+ attendees. All materials used for the tutorial are available in the links below.

We had breakout group discussions of around 10 people each. All the groups took community notes linked below, which we hope can help you see what software others are using for their projects.

**Please make sure to set up your laptop environment BEFORE the conference, if you plan on attending the hands-on session, as the conference WiFi will not support everyone downloading 2-4 GB on the day of the tutorial. See [Quick Start](#quick-start) below.**

[Quick Links](#quick-links)

[Overview](#overview)

[Quick Start](#quick-start)

[Contributing](#contributing)

[Schedule](#schedule)

[Breakouts](#breakouts)

[Organizers](#organizers)

## Quick Links

This GitHub repository: [bit.ly/icra23_ros_git](https://github.com/osrf/icra2023_ros2_gz_tutorial)

Docker Hub repository: [bit.ly/icra23_ros_docker](https://hub.docker.com/r/osrf/icra2023_ros2_gz_tutorial/tags)

Presentations and tutorial slides: [bit.ly/icra23_ros_slides](https://drive.google.com/drive/folders/10oGspKiLUR3ft-f-4iHQU1SHTH6pUx9M?usp=sharing)

Breakout discussions: [community notes](https://drive.google.com/drive/folders/17guPLFHlZiY3TJ-tWCqIEWgCdLxUG7Lg?usp=share_link)

Post-tutorial survey: [bit.ly/icra23_ros_survey](https://forms.gle/YU7oLKuWA7WTpZ887)

## Overview

Software development, an end in itself in industry, is often a means to an end in academic robotics research, where the goal is to create a prototype, which happens to require software, to illustrate that a novel method works in most cases, downscoped by its assumptions.

Whereas academic users expect software to "just work" out of the box, including sophisticated features such as advanced mathematics, to demonstrate a "good enough" nominal case, industry users require all corner cases of vanilla features to be robust or even guaranteed by certification for mission-critical production software. On the other hand, academic research has lately imposed stronger requirements on robustness in simulation, for large-scale long-duration machine learning training.

While industry users can afford the engineering to exactly suit their needs, academic users are motivated by factors such as a timeline characterized by transient student graduation cycles and limited software development time between short publication cycles, development toward software prototypes as opposed to robust long-term reliable or mission-critical production software, sophisticated algorithmic developments that potentially depend on multiple large existing packages simultaneously (for example, ROS, Gazebo, MoveIt, and OpenAI Gym) to create cutting-edge research innovations, typically smaller software packages and development teams, and smaller fleets of robots compared to large warehouse logistic operations, to name a few.

These factors mean that academic users have less time to understand the foundations of software tools, for example, network communications underlying middleware, physics and rendering underlying robotics simulation, software design paradigms and performance, and proper development process for open source software. As a concrete example, Data Distribution Service (DDS) is a critical building block of ROS 2 when it comes to basic usage and performance. For Gazebo, it means understanding how physics engines differ and choosing the one with the numerical stability or performance best for the specific robotics sub-domain. These choices can affect simulation and real robot results dramatically. Without understanding these differences and choices, it could make a software appear unsuitable or even unusable, when the solution is simply proper configuration.

After [8 distribution releases of ROS 2](https://docs.ros.org/en/rolling/Releases.html) and with [ROS 1 official support coming to an end in 2025](http://wiki.ros.org/Distributions), at ICRA 2022 Philadelphia, we found that many current ROS 1 users in academia still had questions about whether and when they should migrate to ROS 2.

While ROS 2 has seen wide industry adoption, including mission-critical space applications and autonomous vehicles, academic users have been uncertain. In this tutorial, we hope to address the uncertainty by exposing attendees to new features in ROS 2 and the new Gazebo (formerly Ignition) through hands-on exercises using examples developed for real-world applications.

Audience:
- [ROS](https://www.ros.org/) 1 users wondering whether to to migrate to ROS 2 users new to ROS
- ROS 2 users
- Gazebo-classic users wondering whether to migrate to new Gazebo
- Users wondering whether the new Gazebo is right for them
- Users of other simulators looking to learn about the new Gazebo and existing infrastructure we worked on with Nvidia, DeepMind, and Toyota Research Institute in the past few years to handle format conversions between SDF and formats used by OmniVerse, MuJoCo, and Drake.

## Quick Start

Clone this repository:
```
git clone https://github.com/osrf/icra2023_ros2_gz_tutorial.git
```

We will be using Ubuntu Jammy (22.04), ROS 2 Humble, and Gazebo Garden.

Follow the installation instructions in [`docker/README.md`](https://github.com/osrf/icra2023_ros2_gz_tutorial/blob/main/docker/README.md) to get set up and running.

## Contributing

Here's a [list](./PROJECTS.md) of open source products and projects publically known to be using ROS 2 and/or new Gazebo.

If you would like to submit your project to be added this list, please follow the directions below.

The list is meant to serve as usage examples for the community’s reference and interactions in their own time. It is not meant for for-profit advertisement. We do not promise to feature any of the entries live on the tutorial day.

#### Criteria
- Must use ROS 2 or the new [Gazebo](https://gazebosim.org) (formerly Ignition), i.e. if the project uses ROS 1 and [Gazebo-classic](https://classic.gazebosim.org), it does not satisfy this criterion.
- Open source
- Preferably, there is a visual representation (image, video, etc) in the URL you provide.

#### What to submit

This is not a contribution in the formal sense. We are simply asking for a project title, URL, and a one-line description (please keep it short).

These should be substantial projects beyond hello-world tutorials and examples we already provide.

For example projects, see recent [monthly Gazebo Community Meetings](https://community.gazebosim.org/tag/meeting) and [ROS News for the Week](https://discourse.ros.org/tag/weekly-update), e.g.
- [Gazebo Community Meeting Aug 2022: Intern projects](https://community.gazebosim.org/t/community-meeting-interns-2022-aug-2022/1549)
- [Gazebo Community Meeting Jun 2022: Surface ocean wave rendering and AUV simulation](https://community.gazebosim.org/t/community-meeting-maritime-jun-2022/1472)
- [Gazebo Community Meeting Apr 2022: MOV.AI Flow ROS IDE](https://community.gazebosim.org/t/community-meeting-mov-ai-flow-ros-ide-apr-2022/1379)
- [Gazebo Community Meeting Jan 2022: Pan-African competition](https://community.gazebosim.org/t/community-meeting-pan-african-competition-simulation-for-ci-jan-2022/1230)

#### How to submit

Open a pull request in this repository. Your code change should be a short one-line bullet list item added to the PROJECTS.md file. Fill out the pull request template for Project Contribution. Prefix your pull request title with [Project].

#### Why submit

Visibility for your open source project and community interaction.

#### When to submit

There is no formal deadline in the conventional sense of workshop contributions. View this as an open source contribution, where pull requests are opened and reviewed on a reasonable timeline.

Thank you for your contribution.

## Schedule

While it is impossible to cover all of the software foundations underlying ROS 2 and Gazebo (or other simulators), we hope to expose attendees to such factors, the new features in ROS 2 and Gazebo, and give them an avenue of resources to follow when they encounter obstacles while using these software in their robotics research.

In the first half of the day, we will first discuss reasons one might choose ROS 2, feature comparisons between ROS 1 and ROS 2 [[1](https://www.science.org/stoken/author-tokens/ST-483/full)], whether ROS 2 is right for different applications, and our migration resources. Then, we will have a short breakout discussion for attendees to share and discuss their use of ROS and ROS 2. The main portion of the tutorial is a hands-on session for the attendees to try out ROS 2 on their laptops, using [our Dockerfiles](https://hub.docker.com/_/ros), which is part of our regular infrastructure and is automatically updated nightly on Docker Hub.

In the second half of the day, we will have a similar discussion about migrating from [Gazebo-classic](https://classic.gazebosim.org/) to the [new Gazebo](https://gazebosim.org/) (formerly Ignition), and hands-on practice.

References

[1] Steven Macenski, Tully Foote, Brian Gerkey, Chris Lalancette, and William Woodall. [Robot Operating System 2: Design, architecture, and uses in the wild](https://www.science.org/stoken/author-tokens/ST-483/full). Science Robotics, May 2022. Volume 7, issue 66. DOI 10.1126/scirobotics.abm6074

### Schedule:

1. Welcome and Intro (9:00 am, 5 mins, Mabel Zhang)

2. ROS 2 - What's New? (9:05 am, 50 mins, Chris Lalancette)
    1.  Cross-platform (Linux, Windows, macOS)
    2.  Rolling release
    3.  Pluggable comms/rmw layer at runtime (default middleware is DDS)
    4.  Client Libraries (rclcpp, rclpy)
    5.  Parameters
    6.  Composable nodes
    7.  Lifecycle nodes
    8.  Launch in Python, XML, YAML
    9.  Security (SROS2)
    10. DDS
    11. Present and elaborate on points of whether people should switch to ROS 2
        1. Community projects built on top of ROS 2
            1.  microROS for running on embedded systems
            2.  navigation2
            3.  MoveIt 2
            4.  ros2_control
        2.  Support cycle
        3.  Package availability
        4.  ROS 2 in different domains
            1.  [Open Robotics Middleware Framework (Open-RMF)](https://www.open-rmf.org/) for indoor robot fleets ([GitHub](https://github.com/open-rmf))
            2.  MBZIRC for surface vessels ([GitHub](https://github.com/osrf/mbzirc))
            3.  VIPER for space (publicly [announced](https://www.nasa.gov/viper/lunar-operations), code not public)
            4.  SpaceROS
            5.  Deep reinforcement learning manipulation ROS 2 + MoveIt2 + Gazebo + OpenAI Gym ([Andrej Orsula GitHub](https://github.com/AndrejOrsula/drl_grasping))
    13. Resources - links to [tutorials](https://docs.ros.org/en/humble/Tutorials.html), API documentation, design documents, Discourse, list of Working Groups, simple ROS 2 DDS configurations, ROSCon (all past videos free online), Diversity Scholarships, etc.
    14. Q&A (5 mins)

3. ROS 2 [breakout](#breakouts) discussions (10:00 am, 30 mins)

4. Refreshment break (10:30 am, 10 mins)

5. ROS 2 hands-on guided session with Dockerfile (10:40 am, 105 mins)
    1.  Getting started
    2.  Quick demo of things that should work
    3.  Beginner CLI Tools
    4.  Beginner Client Libraries
    5.  Intermediate Tutorials
    6.  MoveIt 2 Tutorials

6. Lunch (12:30-1:30 pm)

7. All about the new Gazebo, "Alter Ego of Gazebo" (1:30 pm, 50 mins, Mabel Zhang)
    1. What is the new Gazebo
       1. [Releases](https://gazebosim.org/docs/garden/releases)
       2. Showcase per-release demo worlds: [Edifice](https://app.gazebosim.org/OpenRobotics/fuel/worlds/Edifice%20demo), [Fortress](https://app.gazebosim.org/OpenRobotics/fuel/worlds/Fortress%20demo), [Garden](https://app.gazebosim.org/OpenRobotics/fuel/worlds/Garden%20demo)
       3. [Installing with ROS](https://gazebosim.org/docs/latest/ros_installation)
    1. Showcase projects from different application domains: land, space, sea, manipulation
        1. DARPA SubTerranean Challenge ([GitHub](https://github.com/osrf/subt), [3D model collection on Fuel](https://app.gazebosim.org/OpenRobotics/fuel/collections/SubT%20Tech%20Repo)): physics-based rendering (PBR), levels (LOD), distributed simulation, cloud simulation
        1. Rubicon Trail world [3D model on Fuel](https://app.gazebosim.org/OpenRobotics/fuel/models/Rubicon), [snowy model on Fuel](https://app.gazebosim.org/Cole/fuel/worlds/Rubicon%20World%20Snowy): runs with [gazebo-web/gzweb](https://github.com/gazebo-web/gzweb) (web portion not public yet)
        1. MBARI Wave Energy Converter ([GitHub](https://github.com/osrf/mbari_wec_gz), [DockerHub](https://hub.docker.com/r/mbari/mbari_wec)): high-fidelity wave dynamics, physics just as accurate in 400x faster than real time
        1. Community-contributed [wave visualization](https://community.gazebosim.org/t/simulate-surface-waves-and-marine-vehicle-dynamics/1268/6) by Rhys Mainwaring
        1. MBARI Long-Range Autonomous Underwater Vehicle ([GitHub](https://github.com/osrf/lrauv), [DockerHub](https://hub.docker.com/r/mbari/lrauv-gazebo-sim/tags)): 100x faster than real time, point cloud visualization, 3D plotting
    1. Tools
       1. 2D plotting
       2. 3D plotting
       3. Native point cloud visualization
    1. [Gazebo Fuel](https://app.gazebosim.org/dashboard): a free online 3D models dataset
    1. Blender resources for modeling - [SDF export](https://github.com/gazebosim/gz-sim/blob/31f7d5b384408eb88db3fcc85cc5529eb926f069/tutorials/blender_sdf_exporter.md), [procedural generation](https://github.com/gazebosim/gz-sim/blob/31f7d5b384408eb88db3fcc85cc5529eb926f069/tutorials/blender_procedural_datasets.md) (community-contributed, Andrej Orsulo)
    1. Migration from Gazebo-classic: [feature comparison](https://gazebosim.org/docs/garden/comparison), [migration tutorials](https://gazebosim.org/api/sim/7/tutorials.html) (scroll to bottom)
    1. Format conversions with other simulators
        - Nvidia Omniverse ([OSRF GitHub gz-omni](https://github.com/gazebosim/gz-omni), [Nvidia docs](https://docs.omniverse.nvidia.com/app_isaacsim/app_isaacsim/tutorial_ros2_gazebosim.html?highlight=gazebo), [OSRF announcement](https://community.gazebosim.org/t/ign-omni-is-available/1413), [Nvidia announcement](https://discourse.ros.org/t/nvidia-isaac-sim-latest-release-update-with-gazebo-bridge-and-new-features/26130), and [Nvidia Isaac announcement](https://developer.nvidia.com/blog/expedite-the-development-testing-and-training-of-ai-robots-with-isaac-sim))
        - MuJoCo ([OSRF gz-mujoco](https://github.com/gazebosim/gz-mujoco))
        - Drake ([OSRF GitHub Project Board](https://github.com/orgs/gazebosim/projects/2))
    1. Resources - [Documentation](https://gazebosim.org/docs), [Tutorials](https://gazebosim.org/api/sim/7/tutorials.html), [API](https://gazebosim.org/api/sim/7/), [Gazebo Community site](https://community.gazebosim.org/), [monthly Gazebo Community Meetings](https://community.gazebosim.org/tag/meeting), etc.
    1. Q&A

8. Gazebo [breakout](#breakouts) discussions (2:20 pm, 30 mins)

10. Gazebo hands-on guided session with Dockerfile (2:50 pm, 90 mins)
    1. Quick demo of things that should work
    1. Developer resources
        1. [Documentation](https://gazebosim.org/docs)
        1. [Tutorials & library API](https://gazebosim.org/docs/garden/tutorials). gz-sim is entry point library
        1. [Gazebo Fuel](https://app.gazebosim.org/dashboard), free online database of 3D models and worlds
        1. [Feature comparison](https://gazebosim.org/docs/garden/comparison) with Gazebo-classic
        1. [gazebosim GitHub org](https://github.com/gazebosim), [GitHub Project board](https://github.com/orgs/gazebosim/projects/1)
        1. Development [roadmap](https://gazebosim.org/docs/garden/roadmap) and [processes](https://gazebosim.org/docs/garden/development) (CI, contributing guidelines, release process)
        1. [Integration with ROS 2](https://gazebosim.org/docs/garden/ros2_integration) with [`ros_gz`](https://github.com/gazebosim/ros_gz)
    1. Pair up. At your own pace, choose one or more from the following tutorials:
        1. Command line interface, bash completion
        1. GUI intro `gz sim` using out-of-the-box worls on Gazebo splash screen
           1. Component inspection panel: physics time step, real time factor
           2. Real time factor detailed panel on lower-right
           3. Entity tree panel
           4. Camera views: Move To, Follow
           5. Reset button
           6. Other [example](https://github.com/gazebosim/gz-sim/tree/ign-gazebo6/examples) worlds that ship with Gazebo
        1. Levels (concept similar to Level of Detail) rendering
           1. [Levels tutorial](https://github.com/gazebosim/gz-sim/blob/gz-sim7/tutorials/levels.md)
           1. `gz sim levels.sdf --levels`
           1. `gz topic -t "/model/vehicle_blue/cmd_vel" -m gz.msgs.Twist -p "linear: {x: 4.0}"`
           1. `gz topic -t "/model/vehicle_red/cmd_vel" -m gz.msgs.Twist -p "linear: {x: 2.0}"`
           1. Model tiles defined in SDF will load and unload in the proximity of moving vehicle
        1. [Using sensors tutorial](https://gazebosim.org/docs/garden/sensors)
        1. Developing a Gazebo system plugin
           1. Entity Component System (ECS)
           2. API for system plugins, PIMPL
           3. Simple system plugin walkthrough: [thermal camera](https://github.com/gazebosim/gz-sim/tree/gz-sim7/src/systems/thermal)
           4. All system plugins live [here](https://github.com/gazebosim/gz-sim/tree/gz-sim7/src/systems)
        1. Other tutorials
           1. [Tutorials](https://gazebosim.org/docs/garden/tutorials) page on website
           2. gz-sim library [tutorials](https://gazebosim.org/api/sim/7/tutorials.html)

11. Refreshment break (4:20 pm, 10 minutes)

12. Conclusion (4:30 pm)
    1. Ways to get involved with us
        1. For hands-on questions with the community: [ROS Answers](https://answers.ros.org/questions/) (migrating to [Robotics Stack Exchange](https://robotics.stackexchange.com/)), [Gazebo Answers](https://answers.gazebosim.org/questions/)
        2. For high-level discussions: [ROS Discourse](https://discourse.ros.org/), [Gazebo Community](https://community.gazebosim.org/)
        3. [ROS News for the Week](https://discourse.ros.org/tag/weekly-update), Monthly [Gazebo Community Meetings](https://community.gazebosim.org/tag/meeting)
        4. Pull requests to our GitHub repositories: [ros2](https://github.com/ros2), [gazebosim](https://github.com/gazebosim/), [Gazebo GitHub Project Board](https://github.com/orgs/gazebosim/projects/1)
        5. Participate in ROS Working Groups - Navigation, Manipulation, Control, Embedded, Real-time, Safety, [Maritime](https://github.com/ros-maritime/community/), etc. See [Project Governance](https://docs.ros.org/en/rolling/The-ROS2-Project/Governance.html)
        7. Summer internships through Google Summer of Code (GSoC) and Google Season of Docs (GSoD)
        8. [ROSCon](https://roscon.ros.org/) annual developers conference, and [Diversity Scholarships](https://discourse.ros.org/search?q=roscon%20diversity%20scholarship) to attend ROSCon
    2. Open-floor Q&A and discussions

## Breakouts

Please take notes [here](https://drive.google.com/drive/folders/17guPLFHlZiY3TJ-tWCqIEWgCdLxUG7Lg?usp=share_link).

### ROS 2

Suggested discussion topics for ROS 2 breakout:

1. What ROS version are you using, ROS 1 or 2? If you are not using ROS, what middleware are you using?
1. What is your application domain?
1. What problems have you encountered with ROS 1, if any? To your knowledge, does ROS 2 solve any of them?
1. If you are using ROS 1, what stops you from migrating to ROS 2?
1. If you have used both ROS 1 and ROS 2, what do you like and dislike about each? Are there problems in one version that are solved in the other?
1. What problems have you encountered with ROS 2?

### Gazebo

Suggested discussion topics for Gazebo breakout:

1. What simulator do you currently use? Why did you choose it? Which other simulators have you evaluated before choosing it, if any?
1. If you are using a simulator, what are you using it for? Are you using it for development? For testing? For continuous integration?
1. Have you ever used Gazebo-classic? Have you heard of the new Gazebo (formerly Ignition)? What do you know about the new Gazebo?
1. What are the most important problems that your current simulator DOES address for your use case?
1. What are the most important problems that simulators do not address for your use case? This can be a limit of the state of the art, or of the particular simulators you have tried. For example, contact physics, deformable objects, approximate hydrodynamics, rendering of specific environments, etc.

## Organizers
Mabel Zhang, Open Robotics team at Intrinsic

Chris Lalancette, Open Robotics team at Intrinsic

### Facilitators

The organizers thank the following facilitators (alphabetical by first name) from the community for helping to make the tutorial happen:
- Andrej Orsula, University of Luxembourg
- Rakesh Vivekanandan, Oregon State University
- Rhys Mainwaring
- Timothy R. Player, University of Washington Applied Physics Lab
