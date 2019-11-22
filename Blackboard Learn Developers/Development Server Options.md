# Development Server Options
Setting up a development server is the same as installing Learn on a staging
or production server. This requires several steps including selecting and
installing the appropriately scaled hardware,installing and configuring the
operating system, the database, and the Learn Application.

## The Learn Developer Virtual Machine

Recognizing that there may be constraints on resources that could preclude a
stand-alone development environment, the Learn Product Development team has
prepared a Virtual Machine based environment for your use. This Virtual
Machine is built on the CentOS Linux operating system and contains a developer
instance of Learn with a supporting database. This approach allows for fast
and consistent set-up and recovery of development instances, while minimizing
hardware requirements. Keeping in mind that the development system is not
about optimizing performance, but deploying, concept/UI testing, and debugging
of code, many developers run the Learn Developer VM on laptops with 4GB of RAM
and processors in the 1.8GHz range or similarly smaller scaled desktop
hardware. [This author runs the Learn Developer VM on a MacBook Air with 2GHz
i7 and 8GB of RAM.]

The [Learn Developer Virtual
Machine](https://community.blackboard.com/docs/DOC-1104-developer-virtual-
machine) is suited best for initial development and testing after which you
may wish to deploy your extensions on a development or testing instance of
Learn which is running on an architecture more like your production
environment - minimally like data and hardware.

## Stand-alone or Shared Learn Developer Instances

It is often desired to have a single 'group development' server or a post-
initial development system for further testing and development. With a non-
developer license, this system may run against a copy of your full production
data set or with a developer license merely emulate your production
environment hardware.

Note that a stand-alone Learn development environment has the same limitations
as any web application environment regarding team impact.

Instructions for installing and configuring a Learn instance may be found
under the help.blackboard.com Administrator track for the specific version of
Learn you are interested in installing.

