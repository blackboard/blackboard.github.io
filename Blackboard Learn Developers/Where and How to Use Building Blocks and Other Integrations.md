# Where and How to Use Building Blocks and Other Integrations
*Author: Kelley MacEwen*  
*Categories: ['Building Blocks', 'Getting Started', 'OpenDB', 'SOAP Web Services']*  
*Tags: ['design', 'building blocks', 'getting started', 'blackboard learn', 'migrated from edugage', 'webservices', 'developer']*  
<hr />
There are a number of ways with which you can use Building Blocks to extend
and enhance the Blackboard experience. This tutorial will help you to
understand where Building Blocks integrate with the native Blackboard user
interface and begin to think about where best to integrate your tool.

# Blackboard GUI Overview

User interaction with Blackboard Learn is through a portal-like interface that
consists of a header frame with navigational tabs and a content frame for
displaying course sites and other content. Below, we will investigate each of
the major areas of user interaction and highlight where Building Blocks can be
used to extend the product's functionality to integrate with your solution.

## Student Perspective

When any user logs into Blackboard, the user is presented with a portal-like
interface. There are tabs and buttons along the top, there are user tools
along the left hand side, and there are several modules that populate the
content area of the My Institution page. A module can be used to display
information on the My Institution page either before login (when using Portal
Direct Entry) or when a user logs into Blackboard Learn. Certain modules, such
as the "My Announcements" and "My Courses" modules, ship with the product. The
content and layout of the My Institution page is customizable to meet an
individual's or an institution's needs.

When a student enters a course, they are presented with that course's site.
Each course site can contain a number of different areas for holding content,
taking assessments, participating in online discussions, accessing the course
calendar, and using additional course tools among other things. The default
course entry page now also has portal-like capabilities.

## Instructor Perspective

Similar to students, the Courses tab provides instructors with an overview of
those courses that they are teaching. Accessing an individual course displays
a view similar to that a student sees. The instructor Control Panel now
appears as a series of drop-down buttons on the left. In addition, the
instructor has the added ability to enter "Edit" mode to modify his or her
course.

## System Administrator Perspective

System Administrators have access to additional functionality. On the System
Admin panel, a Blackboard administrator is presented with many options to
configure and manage Blackboard Learn.

# Building Blocks - Installed Tools

There are many types of Building Blocks: Modules, Tools, Content,
Authentication Modules, and Content System are the major categories. Module
Building Blocks can be displayed in the portal-like areas of Blackboard Learn,
including on tabs and on course home pages. Tool Building Blocks can be added
to a number of different areas and show up as additional links in the native
Blackboard user interface. Content Building Blocks extend the range and types
of content with which an instructor can populate his or her course.
Authentication modules can be used to facilitate custom authentication or
Single Sign-On requirements. Content System Building Blocks can be used to
alter the workflows used with the Content Management capabilities of
Blackboard Learn.

## Module Building Blocks

As stated above, a module can be used to display information on the My
Institution page either before login (when using the Blackboard Community
System) or once a user logs into Blackboard Learn. An example of a module is
one that displays information from another information system on campus within
the Blackboard user interface. Modules can be added to any tab or to the
course home page.

**NOTE**: Module type Building Blocks are only available to clients who license Blackboard Community System.

## Tool Building Blocks

Tool Building Blocks can be added as links in a number of different areas in
the native Blackboard user interface.

### User Tools

User tools appear on the left hand side of the user interface on the My
Institution page. An example of a user tool might be one that allows a user to
update their contact information directly into your school's student
information system.

### Course Tools

When accessing an individual course, you can see that the left hand column is
populated by several links to access course content. Course tools appear as
links from the "Course Tools" area of each course and are available only to
non-students through the Course Control Panel drop-down.

### Group Tools

It is now possible to add a link within a group to your Building Block. This
would be useful to extend custom collaboration functionality to a group within
a course.

### Tools

Tools appear as links from the "Tools" area of each course and are available
to both students and instructors. An example of a tool might be a link out to
an external course survey tool. Communication type Building Blocks from
previous editions of Blackboard's learning platform will also appear under
this link.

### System Administrator Panel Tools

On the system admin panel, a Blackboard administrator is presented with many
additional options to configure and manage the Blackboard Learn environment.
Tools that are only accessible to the Blackboard administrator are implemented
as system admin tools. Building Blocks can be added as links in the "Tools and
Utilities" area of the system administrator panel. An example of a system
admin tool is one that can run background reporting on a nightly basis.

## Content Type Building Blocks

When building a course, an instructor has the ability to add a number of
different kinds of content to the course site. Content type Building Blocks
enable you to add customized types of content that can be added to each course
site. Custom content is added by using the "More" drop-down in any content
area of a course as shown below.

## Content System Building Blocks

Content System Building Blocks provide hooks into various menus within the
Content Management areas of Blackboard Learn and allow customization of
workflow. In addition, a full range of APIs is available to interact with
stored content.

## Blackboard Tag Libraries

The Blackboard Tag Libraries provide an easy way to leverage the look and feel
of the core Blackboard application inside your tool. Many UI widgets (such as
the calendar or color pickers) are also available for use within your Building
Blocks.

# Behind the Scenes

Some of your ideas might not fit into any of the above Building Block
categories. Examples of these include but are not limited to tools which run
background processes or extend our product through web services - in other
words, "behind the scenes" stuff that might not have a good fit in the user
interface. The Building Blocks architecture also supports these types of tools
and does not require a tool to have a specific "hook "into the Blackboard user
interface.

It is also sometimes desired to link to a Building Block via a tab or a link
placed elsewhere in the user interface in a place other than the areas
detailed above. This scenario would likely require additional steps to deploy,
but it is certainly possible to create other types of links directly to a
Building Block.

# Custom authentication

Blackboard's APIs also support the ability to create your own custom
authentication scenarios. These would allow an institution to leverage
existing investments in central authentication systems or single sign-on
mechanisms above and beyond those supported by the core product. An example of
an authentication customization is using CAS (Central Authentication Service)
for user authentication.

# Web Services

The System Administrator can view installed Web Services, render them
available or unavailable for use, and manage the IP addresses which access a
specific Web Service. Web Services allow a developer to connect to the
Blackboard Learn environment using their choice of programming language
including .NET and PHP. It is also possible to further restrict access to the
Web Services based on more granular security requirements.

# Building Blocks - Proxy Tools

Similar to Building Blocks - Installed Tools, Blackboard Learn ships with a
capability called Building Blocks - Proxy Tools. Based on the IMS Learning
Tools Interoperability standard, Proxy Tools allow a System Administrator to
install and configure an educational tool that runs on an external server.
When combined with the Web Services, the Proxy Tools framework allows a tool
running on another application to be accessed in a secure and seamless manner
using many of the same UI hooks that are provided by Installed Tools as
detailed above.

# Brands and Themes

Branding and themes provide a way to customize the look and feel of the
Blackboard Learn environment by editing the CSS files used to render the
product UI. There are several that ship with the core product. This enables a
high level of customization of the UI at each institution.

# Language Packs

Language Packs allow the customization of the default textual content
throughout the entire product. Not only is this useful for supporting foreign
languages and internationalization, but it also allows an institution to
customize the terminology in the core product to match the pedagogical
terminology in use at the institution. For example, some institutions refer to
courses as modules. It is possible to change the display of this text in the
Blackboard UI to reflect these local customizations.

# Other Integrations

It is possible to import IMS Content Packaging-compliant packages, NLN-
compliant content, and SCORM-compliant content when using the Open Standards
Content Player.

