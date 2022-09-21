# PROPOSAL for tutorial: "All about ROS 2 and the new Gazebo"

This is a proposed tutorial for ICRA 2023, pending acceptance.


## Overview

Software development, an end in itself in industry, is often a means to an end in academic robotics research, where the goal is to create a prototype, which happens to require software, to illustrate that a novel method works in most cases, downscoped by its assumptions.

Whereas academic users expect software to "just work" out of the box, including sophisticated features such as advanced mathematics, to demonstrate a "good enough" nominal case, industry users require all corner cases of vanilla features to be robust or even guaranteed by certification for mission-critical production software. On the other hand, academic research has lately imposed stronger requirements on robustness in simulation, for large-scale long-duration machine learning training.

While industry users can afford the engineering to exactly suit their needs, academic users are motivated by factors such as a timeline characterized by transient student graduation cycles and limited software development time between short publication cycles, development toward software prototypes as opposed to robust long-term reliable or mission-critical production software, sophisticated algorithmic developments that potentially depend on multiple large existing packages simultaneously (for example, ROS, Gazebo, MoveIt, and OpenAI Gym) to create cutting-edge research innovations, typically smaller software packages and development teams, and smaller fleets of robots compared to large warehouse logistic operations, to name a few.

These factors mean that academic users have less time to understand the foundations of software tools, for example, network communications underlying middleware, physics and rendering underlying robotics simulation, software design paradigms and performance, and proper development process for open source software. As a concrete example, Data Distribution Service (DDS) is a critical building block of ROS 2 when it comes to basic usage and performance. For Gazebo, it means understanding how physics engines differ and choosing the one with the numerical stability or performance best for the specific robotics sub-domain. These choices can affect simulation and real robot results dramatically. Without understanding these differences and choices, it could make a software appear unsuitable or even unusable, when the solution is simply proper configuration.

After [8 distribution releases of ROS 2](https://docs.ros.org/en/rolling/Releases.html) and with [ROS 1 official support coming to an end in 2025](http://wiki.ros.org/Distributions), at ICRA 2022 Philadelphia, we found that many current ROS 1 users in academia still had questions about whether and when they should migrate to ROS 2.

While ROS 2 has seen wide industry adoption, including mission-critical space applications and autonomous vehicles, academic users have been uncertain. In this tutorial, we hope to address the uncertainty by exposing attendees to new features in ROS 2 and the new Gazebo (formerly Ignition) through hands-on exercises using examples developed for real-world applications.


## Tentative schedule

While it is impossible to cover all of the software foundations underlying ROS 2 and Gazebo (or other simulators), we hope to expose attendees to such factors, the new features in ROS 2 and Gazebo, and give them an avenue of resources to follow when they encounter obstacles while using these software in their robotics research.

In the first half of the day, we will first discuss reasons one might choose ROS 2, feature comparisons between ROS 1 and ROS 2 [[1](https://www.science.org/stoken/author-tokens/ST-483/full)], whether ROS 2 is right for different applications, and our migration resources. Then, we will have a short breakout discussion for attendees to share and discuss their use of ROS and ROS 2. The main portion of the tutorial is a hands-on session for the attendees to try out ROS 2 on their laptops, using [our Dockerfiles](https://hub.docker.com/_/ros), which is part of our regular infrastructure and is automatically updated nightly on Docker Hub.

In the second half of the day, we will have a similar discussion about migrating from [Gazebo-classic](https://classic.gazebosim.org/) to the [new Gazebo](https://gazebosim.org/) (formerly Ignition), and hands-on practice.

Audience:
- [ROS](https://www.ros.org/) 1 users wondering whether to to migrate to ROS 2 users new to ROS
- ROS 2 users
- Gazebo-classic users wondering whether to migrate to new Gazebo
- Users wondering whether the new Gazebo is right for them
- Users of other simulators looking to learn about the new Gazebo and existing infrastructure we worked on with Nvidia, DeepMind, and Toyota Research Institute in the past few years to handle format conversions between SDF and formats used by OmniVerse, MuJoCo, and Drake.

References

[1] Steven Macenski, Tully Foote, Brian Gerkey, Chris Lalancette, and William Woodall. [Robot Operating System 2: Design, architecture, and uses in the wild](https://www.science.org/stoken/author-tokens/ST-483/full). Science Robotics, May 2022. Volume 7, issue 66. DOI 10.1126/scirobotics.abm6074

1. Welcome and Intro (5 mins)

2. Is ROS 2 right for me? (50 mins)
    1. Discuss top 5 reasons collected at ICRA 2022 Philadelphia through informal conversations, why people aren't using ROS 2. (Mabel, 5 mins)
    2. Show the table in ROS 2 paper on Science Robotics highlighting ROS 1 vs. 2, 10 bite-size paragraphs of what's new in ROS 2, and 5 example use cases. (Mabel, 5 mins)
    3. Present and elaborate on points of whether people should switch to ROS 2. (Chris, 30 mins)
        1. ROS 2 in different domains
            1. [Open Robotics Middleware Framework (Open-RMF)](https://www.open-rmf.org/) for indoor robot fleets ([GitHub](https://github.com/open-rmf))
            2. MBZIRC for surface vessels ([GitHub](https://github.com/osrf/mbzirc))
            3. MBARI Buoy Sim for underwater ([GitHub](https://github.com/osrf/buoy_sim))
            4. VIPER for space (publicly [announced](https://www.nasa.gov/viper/lunar-operations), code not public)
            5. Examples from the community
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
    4. Resources - links to [tutorials](https://docs.ros.org/en/humble/Tutorials.html), API documentation, design documents, Discourse, list of Working Groups, ROS 2 DDS for dummies (create such a page), ROSCon (all past videos free online), Diversity Scholarships, etc. (5 mins)
    5. Q&A (5 mins)

3. ROS 2 breakout discussions (20 mins)

4. Break

5. ROS 2 hands-on guided session with ROS 2 Dockerfile (90 mins)
    1. Show the existence of ROS 2 [tutorials](https://docs.ros.org/en/humble/Tutorials.html)
    2. Demonstrate CLI tools briefly
    3. Brief walkthrough of code for simple publisher / subscriber example, demonstrate
    4. Demonstrate what you can do with ROS 2 using an existing world from real applications in one of our public repositories above. Includes ROS 2, simulation in new Gazebo, RViz, robot controls.
    5. Configuring DDS / DDS for dummies

6. Lunch

7. All about the new Gazebo (50 mins)
    1. What is the new Gazebo (Mabel / Louise Poubel) (5 mins)
    2. Videos of different application domains: land, space, marine, manipulation (15 mins)
        1. DARPA SubTerranean Challenge ([GitHub](https://github.com/osrf/subt), [3D model collection on Fuel](https://app.gazebosim.org/OpenRobotics/fuel/collections/SubT%20Tech%20Repo)): physics-based rendering (PBR), levels (LOD)
        2. Demo worlds from Gazebo [Edifice](https://app.gazebosim.org/OpenRobotics/fuel/worlds/Edifice%20demo), [Fortress](https://app.gazebosim.org/OpenRobotics/fuel/worlds/Fortress%20demo), Garden releases. 3D models on Gazebo Fuel, a free online database
        3. From community: Deep reinforcement learning manipulation ([Andrej Orsula GitHub](https://github.com/AndrejOrsula/drl_grasping))
        4. MBZIRC for surface vessels ([GitHub](https://github.com/osrf/mbzirc), [3D model collection on Fuel](https://app.gazebosim.org/OpenRobotics/fuel/collections/mbzirc))
        5. MBARI LRAUV ([GitHub](https://github.com/osrf/lrauv)): science data visualization, 3D plot of robot movement
        6. MBARI Buoy Sim for underwater ([GitHub](https://github.com/osrf/buoy_sim))
        7. From community: [Wave simulation](https://community.gazebosim.org/t/simulate-surface-waves-and-marine-vehicle-dynamics/1268/6)
    3. Blender resources for modeling - SDF export, procedural generation (5 mins)
    4. Format conversions with other simulators (10 mins)
        - Nvidia Omniverse ([OSRF GitHub gz-omni](https://github.com/gazebosim/gz-omni), [Nvidia docs](https://docs.omniverse.nvidia.com/app_isaacsim/app_isaacsim/tutorial_ros2_gazebosim.html?highlight=gazebo), [OSRF announcement](https://community.gazebosim.org/t/ign-omni-is-available/1413), [Nvidia announcement](https://discourse.ros.org/t/nvidia-isaac-sim-latest-release-update-with-gazebo-bridge-and-new-features/26130), and [Nvidia Isaac announcement](https://developer.nvidia.com/blog/expedite-the-development-testing-and-training-of-ai-robots-with-isaac-sim))
        - MuJoCo ([OSRF gz-mujoco](https://github.com/gazebosim/gz-mujoco))
        - Drake ([OSRF GitHub Project Board](https://github.com/orgs/gazebosim/projects/2))
    5. Resources - Tutorials, API documentation, design documents, Gazebo Community site, past Community Meetings, etc.
    6. Q&A

8. Gazebo breakout discussions (20 mins)

9. Break

10. Gazebo hands-on guided session with ROS 2 Dockerfile, which ships new Gazebo (90 mins)
    1. Show where to find [documentation](https://gazebosim.org/docs)
    2. Show list of [development libraries](https://gazebosim.org/libs), explain gz-sim is entry point
    3. Show [gazebosim GitHub org](https://github.com/gazebosim), [GitHub Project board](https://github.com/orgs/gazebosim/projects/1)
    4. Show [Gazebo Fuel](https://app.gazebosim.org/dashboard), free online database of 3D models and worlds
    5. Demonstrate CLI tools briefly, show `--help`, bash completion
    6. Demonstrate what you can do with new Gazebo using a simple [example](https://github.com/gazebosim/gz-sim/tree/ign-gazebo6/examples) world that ships with Gazebo, such as [`multi_lrauv_race.sdf`](https://github.com/gazebosim/gz-sim/blob/ign-gazebo6/examples/worlds/multi_lrauv_race.sdf)
        1. Physics panel: time steps, real time factor
        2. Entity tree panel
        3. Keyboard control of [`diff_drive.sdf`](https://github.com/gazebosim/gz-sim/blob/ign-gazebo6/examples/worlds/diff_drive.sdf)
        4. Splash screen demo worlds
    7. Demonstrate what you can do with new Gazebo using a world(s) from real applications in one of our public repositories above. Includes models from Gazebo Fuel.
        1. Physics-based rendering (PBR)
        2. 2D plots of topics
        3. 3D plot of robot movement
        4. Point cloud visualization
        5. Levels (LOD) rendering
        6. Multi-robot
    8. Show developer resources
        1. [Feature comparison](https://gazebosim.org/docs/fortress/comparison) with Gazebo-classic
        2. [Roadmap](https://gazebosim.org/docs/fortress/roadmap)
        3. [Development](https://gazebosim.org/docs/fortress/development) (CI, contributing guidelines, release process)

11. Conclusion (30 mins)
    1. Ways to get involved with us
        1. For hands-on questions with the community: [ROS Answers](https://answers.ros.org/questions/), [Gazebo Answers](https://answers.gazebosim.org/questions/)
        2. For high-level discussions: [ROS Discourse](https://discourse.ros.org/), [Gazebo Community](https://community.gazebosim.org/)
        3. Pull requests to our GitHub repositories: [ros2](https://github.com/ros2), [gazebosim](https://github.com/gazebosim/)
        4. Participate in ROS Working Groups - Navigation, Manipulation, Control, Embedded, Real-time, Safety, [Maritime](https://github.com/ros-maritime/community/), etc. See [Project Governance](https://docs.ros.org/en/rolling/The-ROS2-Project/Governance.html)
        5. Monthly Gazebo Community Meetings
        6. Summer internships with us directly, or through Google Summer of Code (GSoC) and Google Season of Docs (GSoD)
        7. ROSCon annual conference, and Diversity Scholarships to attend ROSCon
    2. Open-floor Q&A and discussions


## Organizers
Mabel Zhang, Open Robotics

Chris Lalancette, Open Robotics
