# Starter Building Block Readme
This is the readme for the Starting Building Block. The Starter Building block
is available in the [Blackboard maven
repository](https://community.blackboard.com/external-link.jspa?url=https%3A%2
F%2Fbbprepo.blackboard.com%2Fcontent%2Frepositories%2Fpublic%2Fblackboard%2Fbb
dn%2Fstarting-block).

# Caveat

_DO NOT INSTALL THE STARTER BLOCK ON A PRODUCTION SYSTEM OR ANY SYSTEM
ACCESSIBLE VIA THE PUBLIC INTERNET._ Installing the starting block on a
production system presents a security risk.

# Introduction

The Starting Block Building Block can be used to dynamically deploy another
Building Block for the purpose of testing changes. It is for use during the
development cycle of a Building Block and should not be used on a production
system. The Starting Block performs no authorization on requests and therefore
represents a large security hole on anything but a development system.

The Starting Block only works with local files and therefore any file
indicated for installation must be directly visible to the server on which the
Starting Block resides.

# Usage

The Starting Block is invoked directly via URL. To access the help screen
(which lists all available actions/options) install the Starting Block on your
server and then go to the following URL:

http://<server>/webapps/bb-starting-block-<schema>/execute/help

The above URL assumes the Starting Block was installed on the default Virtual
Installation. Replace <server> with your servers domain and <schema> with your
schema name. On newer systems, this should be **_BBLEARN_**, on older systems,
this should be **_bb_bb60._**

# Invocation

Since the Starting Block can be "called" using a URL, it can be invoked
through a standard web browser (using a bookmark). However, it is easier to
incorporate the invocation of the Starting Block into the build script of your
Building Block.

## Invocation Via Gradle

The [Basic B2 Template](https://community.blackboard.com/external-
link.jspa?url=https%3A%2F%2Fgithub.com%2Fblackboard%2Fbasic-b2-template)
project contains all the information you need to use the Starter Block from
your Gradle build process. A Gradle task was added called '_deployB2_' that
takes care of everything for you. To invoke, simply type '_gradle deployB2_'
or '_gradlew deployB2_' at the command line in the root directory of your
project, or configure the task to be called from your IDE's Gradle plugin.

## Invocation Via Ant

A sample Ant build file has been included in this package in order to
demonstrate how this can be done (see the "deploy" set of build targets in the
sample build file). The build file is a complete Building Block build file and
may be useful as is for your own Building Block.

### Ant Build File Caveats

If you plan on using the sample build file for your own project don't forget
to change the project name attribute.

In order to invoke the Starting Block from Ant, the "get" Ant task is being
used. Unfortunately, there is no easy way to take the output of that task (the
output of the Starting Block written to a file) and render it to the user. As
such, the user must examine it manually (stored in distrib/deploy.out) or
update the Ant script with a platform specific call to echo the contents of
the file. Generally speaking though, the output of the Starting Block is not
important since there is very little that can go wrong if the "get" request is
successful (which Ant will tell you). However, be sure to check deploy.out if
deployment does not seem to be working.

If the WAR file name that should be deployed requires url encoding in order to
properly work with the "get" task (i.e., the WAR file or the path to the WAR
file contain special characters) you will need to update the build file to use
the "makeurl" task. This task is part of the -set-deploy-url target but is
commented out by default since the task is new to Ant 1.7 and will not work
unless you have that version of Ant or newer. If its use is necessary for you,
make sure you have Ant 1.7, uncomment out the task, and then update the
setting of deploy.url to use warfile.url in place of warfile.

