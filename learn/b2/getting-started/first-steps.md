---
layout: post
title: "First Steps" 
categories: Learn b2
id: learn-b2-gs-first-steps
author: Scott Hurrey
---

# First Steps Using Building Blocks
NOTE: For new development, Blackboard recommends building REST and LTI integrations and NOT Building Blocks(B2s). B2s do not work within the Ultra Course UI; REST and LTI works for all Learn deployment and UI options. Use the Developer AMI listed under DVBA for your Blackboard Learn server.

Developing extensions for Learn requires a development environment. Your
development environment refers to (1) the development workstation on which you
will be doing your development work - the actual coding, compiling, and
debugging - and (2) the development server on which you will deploy and test
your extension.

This set of tutorials will provide instruction around setting up your
development workstation, development server, and how to enable debugging of
your code so that you can step through it line-by-line when trying to isolate
issues or bugs. It also covers more generally the overall life cycle of the
typical Blackboard Building Block development project.

### Development Workstation

Your development workstation will host the software and libraries necessary
for writing and building java web applications. This may be any software of
your choice that is up to the task though most development is done using one
of the more prominent Integrated Development Environments - Eclipse, Netbeans,
or IntelliJ. This tutorial will focus on using Eclipse (with some notes re the
use of Netbeans).

#### Development Server

Your development server will host an instance of Blackboard Learn, Developer
Edition - a version of the Blackboard learning platform that we make available
for development purposes that has the Content System, Community System, and
Learning System all enabled to support up to 150 test users, 100 test courses,
and 1000 test enrollment records. In many cases, developers choose to run
Blackboard Learn, Developer Edition on their development workstation rather
than on separate server hardware. Others choose to share a dedicated
development server among multiple developers, each connecting to it from their
individual development workstations. Still others have created their own
virtual machine images that allow unwanted changes to be "thrown away" and
easily restore to a vanilla installation of their development server.

#### Supporting Libraries

Blackboard ships Learn with various proprietary or open-source .jar files as
resources. Blackboard includes or excludes these resources depending only on
the needs of Blackboard Learn. We do not know which ones independent
developers might want to use. When you build a Building Block, do not rely on
the presence of any particular resource in the Blackboard Learn installation.
Instead, include a copy of any necessary resources locally with your
development project.

#### Available Tutorials

The following tutorials are available to help you get started with Building
Block development:

  * [Building Block Development Life Cycle](dev-life-cycle)
  * [Enabling Debugging](enabling-remote-debugging)
  * [First Project: Gradle, Git, and basic-b2-template](first-project-using-gradle-and-git)

