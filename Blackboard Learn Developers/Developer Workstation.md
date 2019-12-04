# Developer Workstation
*Author: Scott Hurrey*
*Categories: ['Building Blocks', 'Getting Started', 'Tutorials']*
*Tags: ['building blocks', 'gradle', 'eclipse', 'netbeans', 'getting started', 'blackboard learn', 'developer workstation', 'ide', 'developer']*
---
This topic is meant to help you set up your Development workstation so that
you can start setting up your Building Blocks projects and get developing
quickly.

## Goals

  1. Setup Your IDE and Supporting Tools
  2. Setup Debugging
  3. Start a Gradle-based Project
  4. Build and Deploy

## Setup your IDE and Supporting Tools

NOTE: As with all software there are potential variations between IDE versions
- and definitely between IDE vendors. This topic provides the highlights.
Additional information for each IDE will be available in the vendor provided
IDE documentation.

### IDE

#### Installing and Configuring Eclipse

Eclipse is a popular and freely available Integrated development environment
that may be used for Blackboard extension development. Eclipse has many
available versions and many plugins that may enhance the software development
experience. See the below Optional Downloads for a purpose built Eclipse. This
section will cover the download and initial setup of your Eclipse environment.
Visit the Eclipse [download](https://community.blackboard.com/external-
link.jspa?url=http%3A//www.eclipse.org/downloads/) site and download
the Eclipse IDE for Java EE Developers. This version provides the minimal
tools necessary for Java web application development. After you have
downloaded Eclipse expand the archive and start the IDE. Once you have started
the IDE check for updates by clicking Help>Check for Updates. The updater will
run and provide updates for installation if there are any available. Based on
your environment and development goals, you might consider adding additional
tools for code repository management. Eclipse (depending on the version
downloaded) includes repository tools for CVS and GIT. If you, or projects you
contribute to, use SVN you may download one of the popular SVN plugins such as
Subversive. There is a plugin available for GIT as well. Eclipse plugins are
easily discovered via web searches or using Help>Eclipse Marketplace or
Help>Install New Software. Instructions for use and setup for these plugins
are a web search away. Of course you may also use non-integrated command line
or desktop tools of your choice. Finally, whether new to Learn extension
development or not, you may find the [Blackboard Plugin for
Eclipse](https://community.blackboard.com/external-
link.jspa?url=http%3A//eclipse.justplainwiley.com/index.php) by Wiley
Fuller useful. It provides a form based wizard for setting up and one-click
deployment to your Learn development server.

#### Installing and Configuring NetBeans

NetBeans is a popular and freely available Integrated Development Environment.
As with Eclipse, NetBeans also provides a comprehensive development
environment and many supporting plugins, but lacks the Learn specific plugin
support as possible in Eclipse. Go to the NetBeans
[download](https://community.blackboard.com/external-
link.jspa?url=https%3A//netbeans.org/downloads/) site and download the
Java EE (or All) Bundle. The NetBeans Java EE Bundle includes support SVN and
GIT code repository access. Instructions for use and setup are a web search
away. Of course you may also use non-integrated command line or desktop tools
of your choice. Additional plugins for NetBeans are found under Tools>Plugins.

For the purposes of this tutorial you should also install the NetBeans Gradle
plugin. This plugin is available on the NetBeans Plugin Portal Update Center
site:

[http://plugins.netbeans.org/plugin/4...gradle-
support](https://community.blackboard.com/external-
link.jspa?url=http%3A//plugins.netbeans.org/plugin/44510/gradle-
support)

Alternatively use the 'Tools>Plugins' action from the NetBeans IDE main menu.

### Gradle and Maven

Gradle is a command line build environment similar to Ant with several
improvements. Maven provides Learn specific build libraries. Both facilitate
quickly ramping up a project though neither are a requirement to get started.
Comprehensive usage of Maven or Gradle are beyond the scope of this
documentation, however this document provides cursory instruction for using
Gradle. For more comprehensive information about Gradle usage and
configuration, visit the Gradle documentation site at[http://www.gradle.org/do
cumentation](https://community.blackboard.com/external-
link.jspa?url=http%3A//www.gradle.org/documentation). Additional
information for using Maven in your Learn extension development cycle is in
the Getting Started with Maven Developer Resource topic. Both Eclipse and
NetBeans support project development using Maven and Gradle. Both require
plugins to be installed. You can check if they are installed by viewing the
list of installed plugins:

#### Maven

  * Eclipse: Installed in Bundle. Help>Install New Software, uncheck the hide installed checkbox and type Maven in the search box or click the "What is already installed?" link.
  * NetBeans: Installed in Bundle. Tools>Plugins, select Available Plugins, and enter Maven in the search field.

#### Gradle

  * Eclipse: Gradle Plugin. Pivital provides a plugin for the Gradle environment which generates Eclipse projects from the gradle build file.
  * NetBeans: Plugin Available. Tools>Plugins, select Available Plugins, enter Gradle in the search field, check the install box and then click the Install Button and follow presented instructions. This plugin allows the opening of of a Gradle project as a project in NetBeans.

[http://www.gradle.org/documentation](https://community.blackboard.com/externa
l-link.jspa?url=http%3A//www.gradle.org/documentation)

Downloading Gradle is not a requirement provided you are using the
basic-b2-template as discussed below.

### Blackboard Learn Vagrant Image

Blackboard provides a Vagrant based Virtual Machine for development use.
Instructions are located in the [Developer Virtual
Machine](https://community.blackboard.com/docs/DOC-1104-developer-virtual-
machine) topic.

### GIT

GIT is the SCM being used to share projects to the Blackboard Developer
community. It is required for management of local repositories and for the
command-line portions of this tutorial.

[http://git-scm.com/downloads](https://community.blackboard.com/external-
link.jspa?url=http%3A//git-scm.com/downloads)

[http://git-scm.com/downloads/guis](https://community.blackboard.com/external-
link.jspa?url=http%3A//git-scm.com/downloads/guis)

Using GIT may be daunting for novice and expert SCM users alike. Two nice git
write-ups that cover the highlights are:

[http://classic.scottr.org/presentati...-in-5-minutes/](https://community.blac
kboard.com/external-
link.jspa?url=http%3A//classic.scottr.org/presentations/git-
in-5-minutes/)<

[http://rogerdudler.github.io/git-
guide/](https://community.blackboard.com/external-
link.jspa?url=http%3A//rogerdudler.github.io/git-guide/)

### Blackboard Starting-Block

_DO NOT INSTALL THE STARTING BLOCK ON A PRODUCTION SYSTEM OR ANY SYSTEM
ACCESSIBLE VIA THE PUBLIC INTERNET._ Installing the starting block on a
production system presents a security risk.

Blackboard distributes a Building Block which facilitates the deployment of
Building Blocks and Reports. The latest version is available via a link at the
bottom of this page. To test the Starting Block you may load the help page:

    https://<yourserver>/webapps/bb-starting-block-BBLEARN/execute/help

Read [Virtual Machines for
Developers](https://community.blackboard.com/docs/DOC-1104-developer-virtual-
machine) for more information on setting up your development server.

## Setup Debugging

Debugging SHOULD NOT be enabled on a production system!!!

### Remote Debugging – Learn setup

Learn is delivered with the ability to enable debugging on the Learn Tomcat
instance. This is done by making a simple change to the Learn bb-
config.properties file:

    #change to true to enable debugging bbconfig.tomcat.debug.enable=false  
    #note this portnumber as it will be used to attach your IDE bbconfig.tomcat.debug.portnumber=2222

NOTE: The Vagrant VM has debugging set to true by default and that the
portnumber is 9878

### Remote Debugging - IDE setup

Both NetBeans and Eclipse support remote debugging.

#### Eclipse

  1. Select Debug Configurations from the Run menu
  2. Select Remote Java Application and add a new configuration
  3. Name the configuration
  4. Select the project to attach to the debugger
  5. Enter the host and port for the remote system
  6. Keep the defaults for the remaining settings
  7. Click the Common tab to add the config to the debug favorites list
  8. Click Okay

#### NetBeans

  1. Select Attach Debugger from the Debug menu
  2. Enter the host and port
  3. Keep defaults for the other settings and click Okay

## Optional Downloads

[Spring Tool Suite (STS)](https://community.blackboard.com/external-
link.jspa?url=http%3A//spring.io/tools)

[starting-block.war (version 1.6)](https://community.blackboard.com/external-l
ink.jspa?url=https%3A//bbprepo.blackboard.com/content/repositories/r
eleases/blackboard/bbdn/starting-block/1.6/starting-block-1.6.war)

The Building Block Starting-Block for rapid deployment of building blocks in
development. _**DO NOT INSTALL ON A PRODUCTION SYSTEM OR ANY SYSTEM ACCESSIBLE
VIA THE PUBLIC INTERNET.**_ Installing the starting block on a production
system presents a security risk.

## Additional Resources

[Getting Started with Eclipse](https://community.blackboard.com/external-link.
jspa?url=http%3A//www.eclipse.org/resources/%3Fcategory%3DGetting%2520
Started)

[Eclipse Documentation](https://community.blackboard.com/external-
link.jspa?url=http%3A//www.eclipse.org/documentation/)

[NetBeans Documentation](https://community.blackboard.com/external-
link.jspa?url=http%3A//www.netbeans.org/kb/60/index.html)

[NetBeans Quick Start Tutorial](https://community.blackboard.com/external-link
.jspa?url=http%3A//www.netbeans.org/kb/60/java/quickstart.html)

