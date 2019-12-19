---
layout: learn
parent: b2s
category: resources-b2
---
# Enabling Remote Debugging
*Author: Scott Hurrey*  
*Categories: ['Building Blocks', 'Getting Started', 'Tutorials']*  
*Tags: ['building blocks', 'eclipse', 'netbeans', 'getting started', 'blackboard learn', 'debugging', 'developer']*  
<hr />
This tutorial will show you how to enable Tomcat debugging so that you can
connect to your Building Block application with a code-level debugger such as
those built into Eclipse and NetBeans.

## Enabling debugging using bb-config.properties

Newer versions of Blackboard Learn have a built-in flag to enable Tomcat
debugging. Follow these steps to turn it on:

  1. Open the file /blackboard/config/bb-config.properties in a text editor
  2. Modify the value bbconfig.tomcat.debug.enable and set bbconfig.tomcat.debug.enable=true
  3. Navigate to /blackboard/tools/admin/ and run PushConfigUpdates.sh/.bat from the command line.
  4. You can now connect with a debugger to port 2222 (or as set in the value for bbconfig.jvm.options.debug.tomcat)

## Setting up Eclipse for Tomcat Debugging

Remote debugging is project specific in Eclipse. Once you have the building
block project created and open you may setup the debugging within Eclipse:

  1. In the Eclipse project view tool bar:
    1. Click on the upward facing arrow next to the “Debug” button (the button with the bug) in the toolbar and
    2. Click on “Debug configurations…”
    3. Alternatively you may select "Run > Debug configurations…" from the Eclipse menu.  

  2. A new window with the current debug configurations will open.
    1. Select “Remote Java Application” in the left list of configuration options and then click on “New launch configuration” button (the button with the folder icon in the top-left corner).
    2. Alternatively you may double-click "Remote Java Application".  

  3. Fill the configuration with the data corresponding with your Tomcat instance:
  * Project: The project you want to debug: it has to contain the source code for the application we want to debug. So include the source in the project build.
  * Connection Type: Standard (Socket Attach).
  * Host: IP of the Learn server being used for debugging.
  * Port: Port indicated to JVM in _address_ parameter. Usually port 2222.

## Execute the Debugger

Once you have built and deployed your Building Block you may click on the
button “Debug” and Eclipse will connect with the Learn instance of Tomcat
(Learn must be running). Now when you put the breakpoints inside the Eclipse
project you may debug as you would normally with a regular project only now it
is remote code running in the Learn Tomcat container.

