# Tutorial: "All about ROS 2 and the new Gazebo"

This is a tutorial that has been accepted to ICRA 2023.

This repository will be updated in the time leading up to the conference.

[Overview](#overview)

[Contributing](#contributing)

[Schedule](#schedule)

[Organizers](#organizers)

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

### Schedule (tentative):

1. Welcome and Intro (9:00 am, 5 mins)

2. Is ROS 2 right for me? (9:05 am, 50 mins)
    1. Discuss top 5 reasons collected at ICRA 2022 Philadelphia through informal conversations, why people aren't using ROS 2. (Mabel, 5 mins)
    2. Show the table in ROS 2 paper on Science Robotics highlighting ROS 1 vs. 2, 10 bite-size paragraphs of what's new in ROS 2, and 5 example use cases. (5 mins)
    3. Present and elaborate on points of whether people should switch to ROS 2. (Chris, 30 mins)
        1. ROS 2 in different domains
            1. [Open Robotics Middleware Framework (Open-RMF)](https://www.open-rmf.org/) for indoor robot fleets ([GitHub](https://github.com/open-rmf))
            1. MBZIRC for surface vessels ([GitHub](https://github.com/osrf/mbzirc))
            1. VIPER for space (publicly [announced](https://www.nasa.gov/viper/lunar-operations), code not public)
            1. SpaceROS
            1. Examples from the community
                1. Deep reinforcement learning manipulation ROS 2 + MoveIt2 + Gazebo + OpenAI Gym ([Andrej Orsula GitHub](https://github.com/AndrejOrsula/drl_grasping))
        2. Pluggable comms/rmw layer at runtime (default middleware is DDS)
        3. Cross-platform (Linux, Ubuntu, macOS)
        4. Launch in Python, XML, YAML
        5. Composable nodes
        6. Lifecycle nodes for better determinism
        7. Security (SROS2)
        8. Rolling release
        9. Projects built on top of ROS 2
            1. microROS for running on embedded systems
            2. navigation2
            3. MoveIt 2
    4. Simple DDS configurations
        1. `RMW_IMPLEMENTATION`
        1. Composition to avoid some performance problems
        1. Inter-process communications can give very good performance
        1. Per-DDS vendor config files
    5. Resources - links to [tutorials](https://docs.ros.org/en/humble/Tutorials.html), API documentation, design documents, Discourse, list of Working Groups, simple ROS 2 DDS configurations, ROSCon (all past videos free online), Diversity Scholarships, etc. (5 mins)
    5. Q&A (5 mins)

3. ROS 2 breakout discussions (10:00 am, 20 mins)

4. Break (10:20 am, 10 mins)

5. ROS 2 hands-on guided session with ROS 2 Dockerfile (90 mins)
    1. Show the existence of ROS 2 [tutorials](https://docs.ros.org/en/humble/Tutorials.html) (2 mins)
    1. Demonstrate CLI tools briefly (10 mins interactive)
    1. Brief walkthrough of code for simple publisher / subscriber example, demonstrate (15 mins interactive)
        1. C++ talker + Python subscriber
    1. Demonstrate what you can do with ROS 2 using an existing world from real applications in one of our public repositories above. Includes ROS 2, simulation in new Gazebo, RViz, robot controls.
       1. [TB4](https://github.com/turtlebot/turtlebot4_simulator/tree/humble) (45 mins interactive)
          1. Launch files (new XML, show Python exists, new YAML)
          1. Services and actions, if TB4 has them
          1. Parameters

6. Lunch (12:00-1:00 pm)

7. All about the new Gazebo (1:00 pm, 50 mins)
    1. What is the new Gazebo (5 mins)
    2. Videos of different application domains: land, space, marine, manipulation (15 mins)
        1. DARPA SubTerranean Challenge ([GitHub](https://github.com/osrf/subt), [3D model collection on Fuel](https://app.gazebosim.org/OpenRobotics/fuel/collections/SubT%20Tech%20Repo)): physics-based rendering (PBR), levels (LOD)
        2. Demo worlds from Gazebo [Edifice](https://app.gazebosim.org/OpenRobotics/fuel/worlds/Edifice%20demo), [Fortress](https://app.gazebosim.org/OpenRobotics/fuel/worlds/Fortress%20demo), Garden releases. 3D models on Gazebo Fuel, a free online database
        3. MBZIRC for surface vessels ([GitHub](https://github.com/osrf/mbzirc), [3D model collection on Fuel](https://app.gazebosim.org/OpenRobotics/fuel/collections/mbzirc))
        4. MBARI LRAUV for underwater ([GitHub](https://github.com/osrf/lrauv)): science data visualization, 3D plot of robot movement
        5. MBARI Buoy Sim ([GitHub](https://github.com/osrf/buoy_sim))
        6. From community: [Rhys Mainwaring Wave simulation](https://community.gazebosim.org/t/simulate-surface-waves-and-marine-vehicle-dynamics/1268/6)
    3. Blender resources for modeling - [SDF export](https://github.com/gazebosim/gz-sim/blob/31f7d5b384408eb88db3fcc85cc5529eb926f069/tutorials/blender_sdf_exporter.md), [procedural generation](https://github.com/gazebosim/gz-sim/blob/31f7d5b384408eb88db3fcc85cc5529eb926f069/tutorials/blender_procedural_datasets.md) (5 mins)
    4. Format conversions with other simulators (10 mins)
        - Nvidia Omniverse ([OSRF GitHub gz-omni](https://github.com/gazebosim/gz-omni), [Nvidia docs](https://docs.omniverse.nvidia.com/app_isaacsim/app_isaacsim/tutorial_ros2_gazebosim.html?highlight=gazebo), [OSRF announcement](https://community.gazebosim.org/t/ign-omni-is-available/1413), [Nvidia announcement](https://discourse.ros.org/t/nvidia-isaac-sim-latest-release-update-with-gazebo-bridge-and-new-features/26130), and [Nvidia Isaac announcement](https://developer.nvidia.com/blog/expedite-the-development-testing-and-training-of-ai-robots-with-isaac-sim))
        - MuJoCo ([OSRF gz-mujoco](https://github.com/gazebosim/gz-mujoco))
        - Drake ([OSRF GitHub Project Board](https://github.com/orgs/gazebosim/projects/2))
    5. Resources - [Documentation](https://gazebosim.org/docs), [Tutorials](https://gazebosim.org/api/sim/7/tutorials.html), [API documentation](https://gazebosim.org/api/sim/7/), [Gazebo Community site](https://community.gazebosim.org/), past Gazebo Community Meetings, etc.
    6. Q&A

8. Gazebo breakout discussions (2:00 pm, 20 mins)

9. Break (2:20 pm, 10 minutes)

10. Gazebo hands-on guided session with ROS 2 Dockerfile, which ships new Gazebo (90 mins)
    1. Show where to find [documentation](https://gazebosim.org/docs) (2 mins)
    1. Show [Gazebo Fuel](https://app.gazebosim.org/dashboard), free online database of 3D models and worlds (5 mins)
        1. MBZIRC boats, SubT, etc
    1. Demonstrate CLI tools briefly, show `--help`, bash completion (15+ mins interactive)
    1. Demonstrate what you can do with new Gazebo using simple [example](https://github.com/gazebosim/gz-sim/tree/ign-gazebo6/examples) worlds that ship with Gazebo
        1. `gz sim` (10 mins)
           1. Splash screen demo worlds - Nao robot
        1. [`diff_drive.sdf`](https://github.com/gazebosim/gz-sim/blob/ign-gazebo6/examples/worlds/diff_drive.sdf) (5 mins)
           1. Keyboard control
        1. [`multi_lrauv_race.sdf`](https://github.com/gazebosim/gz-sim/blob/ign-gazebo6/examples/worlds/multi_lrauv_race.sdf) (15 mins)
           1. Physics panel: time steps, real time factor
           1. Entity tree panel
           1. Multi-robot
    1. Demonstrate what you can do with new Gazebo using a world(s) from real applications in one of our public repositories in the presentation list above. Includes models from Gazebo Fuel.
        1. Physics-based rendering (PBR) (live demo presenter only, not interactive, to save time) (5 mins)
        1. 2D plots of topics (10-15 mins)
           1. [MBARI Buoy](https://github.com/osrf/buoy_entrypoint)
        1. Point cloud visualization from csv (10 mins)
           1. [MBARI LRAUV](https://github.com/osrf/lrauv/)
        1. ~~Levels (LOD) rendering (10 mins)~~
           1. [Levels tutorial](https://github.com/gazebosim/gz-sim/blob/gz-sim7/tutorials/levels.md)
           1. `gz sim levels.sdf --levels`
           1. `gz topic -t "/model/vehicle_blue/cmd_vel" -m gz.msgs.Twist -p "linear: {x: 4.0}"`
           1. `gz topic -t "/model/vehicle_red/cmd_vel" -m gz.msgs.Twist -p "linear: {x: 2.0}"`
    1. Show developer resources (5 mins)
        1. Show list of [development libraries](https://gazebosim.org/libs), explain gz-sim is entry point
        1. Show [gazebosim GitHub org](https://github.com/gazebosim), [GitHub Project board](https://github.com/orgs/gazebosim/projects/1)
        1. [Feature comparison](https://gazebosim.org/docs/garden/comparison) with Gazebo-classic
        1. [Roadmap](https://gazebosim.org/docs/garden/roadmap)
        1. [Development](https://gazebosim.org/docs/garden/development) (CI, contributing guidelines, release process)

11. Conclusion (4:00 pm, 30 mins)
    1. Ways to get involved with us
        1. For hands-on questions with the community: [ROS Answers](https://answers.ros.org/questions/), [Gazebo Answers](https://answers.gazebosim.org/questions/)
        2. For high-level discussions: [ROS Discourse](https://discourse.ros.org/), [Gazebo Community](https://community.gazebosim.org/)
        3. Pull requests to our GitHub repositories: [ros2](https://github.com/ros2), [gazebosim](https://github.com/gazebosim/)
        4. Participate in ROS Working Groups - Navigation, Manipulation, Control, Embedded, Real-time, Safety, [Maritime](https://github.com/ros-maritime/community/), etc. See [Project Governance](https://docs.ros.org/en/rolling/The-ROS2-Project/Governance.html)
        5. Monthly Gazebo Community Meetings
        6. Summer internships through Google Summer of Code (GSoC) and Google Season of Docs (GSoD)
        7. ROSCon annual conference, and Diversity Scholarships to attend ROSCon
    2. Open-floor Q&A and discussions

## Organizers
Mabel Zhang, Open Robotics team at Intrinsic

Chris Lalancette, Open Robotics team at Intrinsic
