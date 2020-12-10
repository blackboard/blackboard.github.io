---
layout: post
title: "Getting Started With LTI" 
id: standards-lti-gs-with-lti
categories: Standards
author: Scott Hurrey
---
# Getting Started With LTI
### Overview

Learning Tool Interoperability is a standard from the IMS Global consortium.
This standard focuses on contextual launches and grade return. For more
information about the standard, see [Learning Tools
Interoperability](https://imsglobal.org/lti).

### Make Your LTI Tool Available to Learn Servers

Once you have developed an LTI tool, you can share it with Learn
administrators so that they can configure their Learn servers to work with it.
To share your tool, you must register your application. When you do so, you
receive an Application ID. Share this Application ID with the administrator of
any Learn server that will use your LTI tool. For more information about
registering your application, see [Register Your Application](https://help.blackboard.com/Learn/Administrator/Hosting/System_Integration/LTI).

### LTI Placement to Building Block Link Mapping

As new LTI Placement options are added to the Blackboard Learn platform, the
naming conventions can be a bit confusing for Building Block Developers. The
purpose of this document is to give a high-level mapping of the terminology
for Developers.

| Description | LTI Placement | B2 Type |
| ----------- |:-------------:|:-------:|
| A tool available to all users in a course | Course Tool->Student | tool |
| A tool available only to instructors in a course | Course Tool->Non-Student | course_tool |
| A course content tool | Course Content Tool | content-handler |
| A tool available outside of a course for all users | System Tool | user_tool |
| A tool available only to system administrators | Administrator Tool | system_tool |

### Caveat

Deleting a registered LTI domain and/or the associated managed placements from the Administrator Panel -> LTI Tool Providers page will invalidate all of the associated LTI launch links in courses. The data will be gone from the database. There is no way to fix this. NEVER delete a registered domain or managed placements without considering these consequences. If you create an LTI 1.3 Tool that uses the same domain as a currently registered LTI 1.1 tool on a Learn system, there is code in Learn that will prompt you to migrate from LTI 1.1 to LTI 1.3. Generally that's a great option. Finally, only very brave people make changes on a production system without testing first on a test or staging system. We recommend you be more cautious than brave.