---
layout: post
title: "LTI or REST?"
id: learn-rest-gs-lti-or-rest
categories: Learn REST
author: Mark Kauffman
---

# LTI or REST? (CURRENTLY A WORK IN PROGRESS)
## Motivation
We are often asked, "When should I use LTI and when should I use REST?" 
"What is the difference?" "What can I do with REST that I can't with LTI
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
When talking about LTI, we use terms like launch, platform, and tool. A Blackboard Learn administrator can set up your tool in Blackboard, following documentation that you provide. Blackboard provides documentation applicable to any LTI tool on help.blackboard.com. Rather than reference a link that may change your best bet for finding such documentation is to use your favorite internet search engine and look for "Blackboard Learn LTI documentation." I just did and the help page for our LTI documentation for admins was the top result! Once your LTI tool has been configured on a Blackboard Learn system by the admin for that system, course instructors can then place links to your Tool in their courses. Search this site for LTI and you will find demonstrations and tutorials on LTI in Blackboard Learn. The most common, and likley the best, way for and instructor to place content from your tool in their course is to use Deep-Linking 2.0. The point of this discussion is that once configured by the administrator, use of your tool and the content it provides looks like it is a part of Blackboard, including when the instructor is selecting content to be 'placed' in the course, and then when the student views and uses that content. And, using the LTI Advantage Names and Roles Provisioning Service (NPRS) and the Assignment and Grades Service (AGS), your tool can integrate closely with the course roster and the gradebook for the course. In summary you can do a lot with LTI 1.3 & LTI Advantage, where the users of the LMS can use your web-application seamlessly from within the LMS and then with the aforementioned services even manipulate the course roster and gradebook.

## REST DISCUSSION

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
