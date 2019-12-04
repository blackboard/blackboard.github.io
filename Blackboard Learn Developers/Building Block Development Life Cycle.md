# Building Block Development Life Cycle
*Author: Scott Hurrey*
*Categories: ['Building Blocks', 'Getting Started']*
*Tags: ['building blocks', 'blackboard learn', 'development lifecycle', 'developer']*
---
There are many things to consider when developing a Blackboard Building Block.
Here we describe the issues involved and provide an overview of the
development process. This is meant to serve as a general guide of how most
projects evolve - not all steps will be necessary in every case scenario and
additional steps may be necessary depending on your case scenario.

# Before Writing Code

## Define the business need and the stakeholders in the project

Your project will likely begin with some sort of need. Perhaps your users want
additional functionality for the user interface. Perhaps your student
information system team wants to automate your data integration so that it can
be real-time. Perhaps you are a system administrator who wants to automate a
manual process. Perhaps you are a school administrator who wants greater
insight into how your Blackboard installation is being used. All of these boil
down into defining the business need for this project. Building Blocks enable
you to integrate and extend Blackboard beyond its core functionality. This
provides an easy way to add value to what is already a significant technology
investment.

When defining the business need for your project, you will want to determine
who the stakeholders are in your project. These are the folks who will fund,
champion, develop, deliver, implement, use, maintain, and support your new
tool. You will want to make sure that these folks are at least aware of your
project, involve them in the initial project discussions, and likely keep them
engaged throughout the duration of your project.

## Assemble your team

Once you determine who is involved and what you want to accomplish, you can
begin to assemble the core team of folks who will develop your Building Block.
This team will likely include a functional lead and a technical lead. The
functional lead will contribute to those discussions relating to usability,
user-friendliness, and where to link to your tool in the user interface. The
technical lead will likely be a developer but may also be the Blackboard
System Administrator doing development work on the side. However, it is
increasingly common for schools have their own dedicated academic developer.
It is also possible that the person doing your Blackboard development also
develops tools for your school's other backend systems including your student
information system. Some schools even get their students involved with
Building Block development through internships, student work programs, and
class projects.

## Scope user functionality

The next step is to clearly define what you want to accomplish with your
integration. You may have heard the term "use case" used in discussion. This
is what we refer to here. You will want to scope out what will (and what will
not) be part of your first version. It is helpful to get users involved and
listen to how they would best like to accomplish the tasks at hand. To
successfully scope functionality, you will want to be familiar with the areas
in which you can use Building Blocks to integrate with our products and the
functionality of our API set. There are helpful tutorials on these topics in
the Getting Started area of this site.

Set deadlines and determine how to define success

You will also want to determine how you are going to define the success of
your project. Some things to consider are successful development of the tool
(a feat in and of itself), adoption rates of the tool, reduction in time or
steps involved in completing a process, enhancements to student-centered
learning, availability of new tools for faculty, tighter integration with
other school systems, increased reporting capabilities, and others.

You will also want to consider setting a deadline for implementing your
project. Many projects fail simply because they are not completed. There are
many challenges to completing a project, but EduGarage provides tutorials,
tips, and an active discussion forum area to support you through your project.

# Before Development

## Get your developer license

When you are ready to begin your Building Block project, you need to find the
member of your organization who has the license to install a developer copy of
the Blackboard product. This is a fully-capable edition of our product that is
limited in the number of users, courses, and enrollments it can support. The
person most likely to have this license is your Blackboard administrator. If
you don't have this license and are an enterprise academic client, you can
likely request one from your Client Manager at no cost. If you are a
commercial partner, click the Business Resources link to the left for
instructions on how to obtain a developer license.

## Set up your development server

The next step is to set up a development server that matches your production
server's version (7.3.216.0, 8.0.184.3, etc) and platform (Windows, Linux,
Solaris). You can find instructions on how to set up your environment in the
Tutorials section of this side and the installers to install Blackboard in the
Download section.

## Set up your development workstation

Now you will need to choose which development environment you'll use to
actually do your development. Popular choices include Eclipse, MyEclipse,
NetBeans, and JBoss Developer Studio. Some of these are free; others come at a
price. The most popular by far are Eclipse and NetBeans. Use whichever is
easiest for you. They all accomplish the same tasks in different ways.

## Determine how to manage code

You will also want to determine how you are going to store and manage your
code. If you are a single developer working on a small project, it might make
sense to just store your code locally (remember to back it up). If you are
working on a larger project or with multiple team members, it makes sense to
use a code versioning tool such as CVS or Subversion. These tools are also
immensely useful when keeping track of changes to your code over time.

# Starting Development

## Start and configure your project in the IDE

To start development, you will need to open your IDE and start your project.
This process will be different with each IDE, but many include a wizard to get
you started. The project that is closest in relation to a Building Block is
the dynamic web application. Using the wizard creates a shell for your
application and makes it easy to get up and running quickly. The only
difference between a Building Block and a web application is the presence of
the bb-manifest.xml file. This file tells Blackboard how and where your tool
integrates with the Blackboard user interface. It is very similar to the xml
configuration file required when developing portlets.

## Choose what the architecture of your project is going to be

There are many schools of thought on how to architect your web application.
There are arguments that favor strict adherence to the MVC (model-view-
controller) design pattern such as can be easily accomplished with Struts.
Other schools of thought favor the ease of using JSPs to process logic
(arguably a bad practice). You will see examples of both approaches on this
site. Most beginners place all of their code in JSPs to start. As their skill
level advances, they begin migrating this code into the controller and comply
more fully with some style of MVC development. If you are willing to persist
through the learning curve, the most commonly seen best practice is to develop
a Struts-based web application. This said, you should be aware that there are
limitations to using Struts with your Building Block application specifically
with portal modules and with the script that is run upon removal of the
Building Block.

## Configure the bb-manifest

As stated above, the bb-manifest.xml file tells Blackboard where and how your
tool will integrate into our user interface. This file will provide a place to
define the type of Building Block (tool, module, or content type), options
associated with each type, other configuration options, and permissions. These
are described in greater detail in the Developer Guide located in the
Documentation area of this site. A more functional overview of where you can
integrate with Blackboard products can be found in the Getting Started area of
this site. A technical developer will determine exactly where to integrate
with Blackboard by working with a functional lead to determine the best
feasible user experience.

## Determine how you will assemble your project for installation

You will want to consider using an automated script to build your project and
prepare it for installation on your development server. It is also possible to
do this by hand, and some IDEs include built-in functionality to automate
building your project. The most popular choice for automating your builds is
Ant, although a new tool called Maven is also increasingly popular. Building
Blocks are assembled and packaged as war/zip files for installation on the
Blackboard server.

# During Development

## Iterate through development

During development, you will make changes to your code, build your project,
and install the resulting war file on your development server using the
Building Blocks Manager area of the System Admin panel. It is a best practice
to remove the old Building Block before installing the new version. The
Building Block will deploy to the
/blackboard/content/vi/bb_bb60/plugins/name_of_your_project/ directory on your
development server. In this directory, you will be able to modify JSPs
directly and see their changes on the next page load. Class files or jar
libraries can also be replaced, but the Building Block will need to be
inactivated and made available again through the Building Blocks Manager
before these changes will load. Compiled JSPs will appear in the
/blackboard/apps/tomcat/work/Catalina/localhost/webapps_name of your project/
directory. These can be deleted here to force recompiling of them on the next
page load.

Logging of Building Block activity can appear in any of several log files.
Always check /blackboard/logs/bb-services-log.txt and the catalina, stdout,
and stderr logs in /blackboard/logs/tomcat/ (Windows) or
/blackboard/apps/tomcat/logs (Linux and Solaris) directories.

As you imagine, this is a very manual and potentially time consuming process.
The Starter Block discussed in the 2007 DevCon presentation titled "Best
Practices for Building, Testing and Deploying Building Blocks" automates this
process by using HTTP calls and an Ant script. You can download this tool in
the Developer Tools areas of the Downloads section of this site.

## Comment your code

Always, always, always comment your code, especially if you are using a non-
standard practice. You will forget how things work and why you did things in a
certain way. Make life easier for yourself and whoever maintains your code by
commenting it well.

## Keep track of your changes

Going a step beyond commenting your code is using a code versioning system to
keep track of changes made in each version of your product. This is a
recommended best practice.

# Testing / QA

## Determine what to test and how to test it

One often overlooked step when developing a new Building Block is testing.
Testing involves not only verifying that your code works, but that it can
scale to meet the demand of a large user base, and that it adequately and
accurately meets the needs of your users.

One of the most common tools to test code is called JUnit. It allows an
automated programmatic script to test API calls. For example, with JUnit you
can automate making a connection to a database, adding a record, and closing
the connection 100 times sequentially and then verify that 100 records made it
into the database. There is another tool along these lines called HTTPUnit
which can perform the same type of testing for web sites. It can load your
Building Block, perform an action, and verify the success of that action
programmatically. In addition to HTTPUnit, there is also a tool called Grinder
that can be used to load test your Building Block.

Your use cases defined when the project begins roughly correspond to test
cases used to verify that your new tool meets the requirements set forth by
the project team. You should run through each of these and complete an end-to-
end verification that your tool works and behaves as desired.

## Get your users involved

You should absolutely also involve a certain subset of your users with your
project. In addition to being an exciting experience for them, it will provide
the development team with valuable feedback relating to if the tool meets the
needs of your users. This is often called user acceptance testing. Just be
careful about scope creep. Your version 1 of your tool is just that - version
1. Record everyone's ideas and input but set the expectation that additional
functionality will be considered for future versions only.

# Releasing your product

## Consider running a trial or beta program

Consider encouraging the same team that helped with user acceptance testing to
serve as the first users of the new tool in your production environment.
Depending on how your tool is implemented, you may be able to limit who can
see the tool in the Blackboard user interface. A best practice is to install
your Building Block and leave the default Course/Org availability as
Unavailable. Then, have your beta users activate the Building Block within
their individual courses via the Manage Tools area of the Course Control
Panel. The tool won't show by default for all of your users which will avoid
confusion. However, this will not prevent anyone from manually turning this
tool on. For those who license the Community System, portal modules can be
access-restricted by institution role.

## Encourage your power users to train other users

As the participants in your testing and beta programs will be the most
familiar with your product, consider encouraging and providing incentives for
them to instruct others how to use it.

## Have a plan for dealing with bugs and issues

Even the smallest of projects will have a bug or two that escapes the
testing/QA cycle. You should have a process for dealing with these issues.
This includes having the ability to report the issues such as through your
existing help desk or a bug tracking tool such as Bugzilla, allowing users to
track the progress of the fix, making the changes, tracking the changes in
your code, testing the changes, and updating your Building Block to its latest
version during regularly scheduled Blackboard maintenance hours.

## Consider sharing your project

Many of the free and almost all of the open source Building Blocks that are
available come from the innovation of this developer community. If you would
like to consider open sourcing your project, you need to consider several
things. These include university intellectual property policy, licensing of
your open source tool, variances in APIs among product versions, variances in
platform (Windows, Linux, Solaris), and maintenance strategy. Each of these
can be relatively easily addressed.

[OSCELOT](https://community.blackboard.com/external-
link.jspa?url=http%3A//www.oscelot.org/) (the Open Source Community for
Educational Learning Objects and Tools) has assisted many with open sourcing
their projects in the past. To learn more, visit their web site.

# Maintaining your product

## Maintenance issues

The three most common causes of issues when updating a Building Block for the
most recent Blackboard version are API changes, API bugs, and core product jar
library changes. API changes are noted in the Javadoc documentation that ships
with each product. Any API marked as deprecated is likely to be removed in the
next version. API bugs are unlikely to occur, but they can and do occur.
Follow the process detailed in the Help section of this site to obtain
assistance. Libraries also can change between versions. For example, the
version of Struts and the servlet-api are both likely to change with upgrades
made to the core product. Updates to the Tomcat application server in certain
releases can also induce unforeseen and undesired behavior in your Building
Blocks.

## Track changes

Again, even if you choose not using a code versioning system to track code
changes, you should at the very least make a backup copy of the source code
and war file for each version.

# Enhancing your product

## _Version 1.1_

Version 1.1 will likely address some of the bugs and minor limitations with
your version 1. This is to be expected. It is a best practice to keep this
sort of information documented so when you find time to complete 1.1, you can
check off your issues down the list.

## _Version 2_

Version 2 will likely address those new feature requests brought up in your
user acceptance testing and beta programs. These would include any that begin
with "It would be nice if..."

## Caveat

You should be aware that although you should keep track of your code versions,
changing the Building Block version in the bb-manifest can have adverse
affects. Notably, impact on data and records associated with your Building
Block which may be lost should you uninstall a previous version to install the
new version.

Always thoroughly test any changes you make to your Building Blocks.

