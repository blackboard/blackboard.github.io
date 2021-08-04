---
layout: post
title: "LTI or REST?"
id: learn-rest-gs-lti-or-rest
categories: Learn REST
author: Mark Kauffman
---

# LTI or REST? (CURRENTLY A WORK IN PROGRESS)
## Motivation
We are often asked questions like, "When should I use LTI and when should I use REST?" "What is the difference?" "What can I do with REST that I can't with LTI
(or vise-versa)?" In this document we discuss the differences, the similarities,
and how you can best design your integration with Blackboard Learn using LTI,
REST, or some combination of both. 

## LTI
LTI stands for Learning Tools Interoperability®. It is a standard developed and published
by the IMS Global® Learning Consortium. You build your integration following the 
[LTI and LTI Advantage standards](https://www.imsglobal.org/activity/learning-tools-interoperability){: target='\_blank'}. 
In LTI-speak, your integration is a "Tool" that integrates with 
a platform (LMS) like Blackboard Learn. Blackboard Learn has been certified to meet the 
LTI standards. If your Tool also follows the standards, you can ensure this by getting
certfied, then your Tool will work with Blackboard Learn, and any platform that has been
certified. This is a big differentiator between LTI and REST. A certified LTI Tool will 
work on multiple LMS Platforms. A platform's REST APIs are always specific to the platform.
But, at the end of the day LTI is a web-application, as is a REST API application. Your Tool,
a web-application following the LTI standard, gets HTTPS requests from and makes HTTPS 
requests to the LMS.

## REST
REST stands for **Re**presentational **S**tate **T**ransfer. It is a
lightweight, flexible web service architecture that allows HTTP commands to be
sent to Web Applications without unnecessary overhead. (REST documentation references HTTP, but to be secure
everything with Blackboard Learn is done over HTTPS.) Blackboard has developed and published
REST APIs for Blackboard Learn. You can find those [here](https://developer.blackboard.com/portal/displayApi){: target='\_blank'}. 

## LTI DISCUSSION
When talking about LTI, we use terms like launch, platform, and tool. A Blackboard Learn administrator can set up your tool in Blackboard, following documentation that you provide. Blackboard provides documentation applicable to any LTI tool on help.blackboard.com. Rather than reference a link that may change your best bet for finding such documentation is to use your favorite internet search engine and look for "Blackboard Learn LTI documentation." I just did and the help page for our LTI documentation for admins was the top result! Once your LTI tool has been configured on a Blackboard Learn system by the admin for that system, course instructors can then place links to your Tool in their courses. Search this site for LTI and you will find demonstrations and tutorials on LTI in Blackboard Learn. The most common, and likley the best, way for and instructor to place content from your tool in their course is to use Deep-Linking 2.0. The point of this discussion is that once configured by the administrator, use of your tool and the content it provides looks like it is a part of Blackboard, including when the instructor is selecting content to be 'placed' in the course, and then when the student views and uses that content. And, using the LTI Advantage Names and Roles Provisioning Service (NPRS) and the Assignment and Grades Service (AGS), your tool can integrate closely with the course roster and the gradebook for the course. In summary, you can do a lot with LTI 1.3 & LTI Advantage, where the users of the LMS can use your web-application seamlessly from within the LMS and then with the aforementioned services even manipulate the course roster and gradebook. Get started with [this documentation](https://docs.blackboard.com/standards/lti/getting-started/getting-started-with-lti).

## REST DISCUSSION
Given how much you CAN do with LTI, why REST APIs? Well, the LMS is also a web application and it can be represented by many different types of 'objects'. Users, courses, enrollments, calendars, announcements, content items, assignments, quizes, etc. If you want a complete view of the representation of a user or course member in Blackboard Learn, you need to use our REST APIs because LTI is written to apply to all platforms, while each platform has it's own nuanced way of representing the different 'objects' in the system. For example a User in Blackboard Learn has a uuuid identifier, an external ID, a datasource ID, a set of system role IDs, a URL for an avatar, etc. Some other LMS may or may not have these. LTI won't give you everything about a User object in Learn, REST APIs will. LTI may give you a subset. Another thing is that LTI doesn't cover things like creating a document in Learn, or pulling a list of all of the different types of content in a course, or creating, reading and deleting announcements. Here's a short-list of 'objects' you can read and manipulate in Blackboard Learn with our REST APIs: Announcements, Attendance/meetings, Calendar, content (in the LMS) & attached files, Assessments, Course Categories, Course Groups, Course Memberships (LTI does have Names & Roles, REST give more information about the membership object), Course Messages, Courses, Data Sources, Institutional Hierarchy Nodes, LTI Placements, Course Roles, Institution Roles, System Roles, User Sessions, Terms, Users. You can get started building your REST Application with [this documentation](https://docs.blackboard.com/learn/rest/getting-started/first-steps).

## REST AND LTI
Now things can get interesting. You might build a pure REST Application, but often the easiest way into your application is an LTI Launch from a course or system page on a Blackboard Learn system. With the LTI launch, you get all of the information about the user and the context from where they came from in the Learn system. This is quite convenient for your user as they have a smooth path to using your application (Tool) from Learn. Next, as the user is already logged into Blackboard Learn, you can behind-the-scenes get an authorization token for making REST API calls back to their Learn system, without having them log in again. (A REST application that doesn't use an LTI launch from Learn will need to ask the user to log into the Learn system they are working with.) Now your LTI Tool/Appication has all of the LTI 1.3 functionality without having to make a bunch of REST API calls for that, and can also make REST API calls for any functinality not available via LTI.

## HAPPY CODING!!
### Glossary

| Term               | Definition                                                                                                                                                     |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| LTI     | Learning Tools Interoperability®, a standard developed and published by the IMS Global® Learning Consortium. |
| REST    | Representational State Transfer. A lightwweight, flexible web service architecture. (Vs older tech like SOAP,etc.)                  |


{: .striped}

#### More Information

We will continue to add new examples, tutorials, and code samples, so make
sure to check these links regularly.

- [Developer Portal](https://developer.blackboard.com/){: target='\_blank'}
- [REST Documentation](https://developer.blackboard.com/portal/displayApi){: target='\_blank'}
- [LTI Documentation](https://www.imsglobal.org/activity/learning-tools-interoperability){: target='\_blank'}
- [Blackboard Learn & LTI Documentation](https://docs.blackboard.com/standards/lti/getting-started/getting-started-with-lti){: target='\_blank'}
