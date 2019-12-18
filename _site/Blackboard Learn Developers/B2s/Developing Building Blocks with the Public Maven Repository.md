# Developing Building Blocks with the Public Maven Repository
*Author: Scott Hurrey*  
*Categories: ['Building Blocks', 'Tutorials']*  
*Tags: ['building blocks', 'gradle', 'blackboard learn', 'maven', 'repository', 'developer']*  
<hr />
As Blackboard shifts to a more modular delivery model, with more features
delivered as Building Blocks at regular intervals, the importance of having a
repository of build objects and documentation has never been more important.
Blackboard’s own development teams have been using an internal Maven
Repository since the summer of 2012 and they have found it to greatly speed up
the Building Block development process.

Developing software with external dependencies is a tough business. Maven has
made this significantly easier by developing a standard binary repository
format that many modern build tools integrate easily with to provide access to
many of the dependencies Blackboard Building Blocks developers might need.
Maven Central, the main repository for the Maven ecosystem, contains a
significant number of popular third party libraries that you may want to use
in your projects.

When developing Building Blocks, though, you will need some libraries from
Blackboard Learn. In the past, to include those libraries, you needed to find
the libraries on a local instance of Blackboard Learn, copy them someplace in
your source tree, write custom dependency logic and build. Plus when you
upgraded to a later Learn version for building, or if you wanted to build
against multiple versions, things got even more complicated.

Blackboard is happy to announce that we have a publicly accessible Maven
repository that can be used to access any of the public API JARs from Learn
for every release going back to 9.1 SP8. This article will show you how to
integrate with the Maven repository using two popular build tools:
[Maven](https:////maven.apache.org/) and
[Gradle](https:///www.gradle.org/).

**The Blackboard Maven repository is hosted at:**

**[https://maven.blackboard.com/content/repositories/releases](https://maven.blackboard.com/content/repositories/releases)**

## When would you use the repository?

A Building Blocks developer would use the repository whenever creating build
scripts for a B2. The Maven Repository will make it easier for a developer to
reference the correct versions of our public API.

## Available Libraries

All Blackboard API libraries are part of the **blackboard.platform** group.
Blackboard publishes these libraries:

Artifact ID | Description
---|---
bb-bbxythos | APIs for the content management subsystem.
bb-cms-admin | APIs pertaining to system administration.
bb-platform | Core platform APIs. This covers the bulk of the APIs typical Building Blocks will use.
bb-taglibs | Standard tag libraries provided by the platform.
bb-ui-webapi | APIs for Building Block developers. Many of the public tags leverage code and resources included in this project.<br />As a webapi, this library must be included in your Building Blocks' WEB-INF/lib path because the platform does not provide it. This webapi includes a resources package that you must expand at the root of your Building Block.
bb-ws-announcement | Web Service stubs and APIs for the announcements subsystem.
bb-ws-calendar | Web Service stubs and APIs for the calendar subsystem.
bb-ws-content | Web Service stubs and APIs for the content subsystem.
bb-ws-context | Web Service stubs and APIs for the session context subsystem.
bb-ws-course | Web Service stubs and APIs for the course subsystem.
bb-ws-coursemembership | Web Service stubs and APIs for the course membership subsystem.
bb-ws-gradebook | Web Service stubs and APIs for the gradebook subsystem.
bb-ws-notificationdistributoroperations | Web Service stubs and APIs for the notification subsystem integration.
bb-ws-user | Web Service stubs and APIs for the user subsystem.
bb-ws-util | Web Service stubs and APIs for the some helpful utilities.
bb-manifest-plugin | XSD for validating the XML in your bb-manifest.xml file.
bb-schema-xsd | XSD for validating the XML in your schema.xml file.
xsscore | Library supporting bb-bbxythos. Make sure you are using the same version of each file, and do not include in your war file.

