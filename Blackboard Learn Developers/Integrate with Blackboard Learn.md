# Integrate with Blackboard Learn
*Author: Ryan Haber*
*Categories: []*
*Tags: ['developer']*
---
# Overview

To integrate with the Blackboard Learn server, you can use the following
approaches.

  * **REST API**. Blackboard recommends using Blackboard Learn's REST API to integrate with Blackboard Learn. REST APIs can be accessed using almost any programming or scripting language. To get started, see [Getting Started With REST](https://community.blackboard.com/docs/DOC-1592-getting-started-with-rest).
  * **Building Blocks** are web applications powered by a Java class library and served along with Blackboard Learn. There are some use cases where Building Blocks are the best solution.
  * **SOAP API**. SOAP is an outdated integration method, superseded by REST, that Blackboard maintains for the time being to maintain backward compatibility.

To integrate with the Blackboard Learn web client application, you can use
**Learn Tools Interoperability** (LTI) integrations.

# Wait. REST? SOAP? I Don't Get It.

That's OK. Take this metaphor as instructive to help you get how the
integration methods relate to each other.

  * A REST API lets a client pass requests and receive responses from a server. The requests and responses are always for chunks of data called resources. Imagine sending a note with your child to school asking for a progress report. When your child's teacher receives the request, he responds with a report card indicating your child's current grades. REST methods typically allow a client to create, read, update, and delete data on the server provided the client has authorization to do so. You might use REST methods to _create_ a new user in Learn, then later to _read_ it. After reading it, you might _update_ it or _delete_ it. If your institution only keeps courses in Learn while they are actively available to students, you might _read_ a collection of all the courses, check which ones are still available, and then send a _delete_ request for each course that should no longer exist in your deployment of Blackboard Learn._  
_

  * A Building Block is more closely coupled to the Learn server than a REST-based application is. If a REST API is like passing notes back and forth with your child's teacher, a Building Block is like having the teacher live in your home with you. The Building Block is, effectively, integrated into your instance of Blackboard Learn as a single application. The "con" of this scenario is that, well, you have a stranger living in your home. The "pro" is that in some cases the integration can do things that it could not otherwise. Like REST-based applications, a Building Block can only do things based on its level of authorization.
  * LTI tools allow you to adapt the user interface of Blackboard Learn to better suit your needs. Integrating an LTI tool is like remodeling your home to add an additional door. With this adapted interface, end users of your Learn instance can access functionality that might otherwise not be built into the Learn user interface.
  * Blackboard has [deprecated our old SOAP API](https://community.blackboard.com/community/developers/blog/2019/01/04/blackboard-deprecates-soap-web-services). As of Q2 2020, it will no longer be available with Blackboard Learn. If you currently use an integration that uses SOAP, you will need to [migrate the integration to REST](https://community.blackboard.com/docs/DOC-5285-soap-to-rest-migration-mapping) or find a new integration that addresses your needs. For purposes of this metaphor, SOAP works in the same way as our REST API. It was just an older, clunkier technology. Blackboard does not support new development with our SOAP API, which will no longer exist starting with the Learn 9.1 release in Q2 2020.

# What's the Right Path For Me?

  * REST API integration is, in almost every case, the best path for you. For more information, see [Getting Started With REST](https://community.blackboard.com/docs/DOC-1592-getting-started-with-rest).
  * If you need to integration with the Blackboard Learn user interface, you'll want to create an LTI tool provider as well. For more information, see [Learning Tools Interoperability | IMS Global Learning Consortium](https://community.blackboard.com/external-link.jspa?url=http%3A%2F%2Fwww.imsglobal.org%2Factivity%2Flearning-tools-interoperability).

