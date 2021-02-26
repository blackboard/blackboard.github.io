---
layout: post
title: "Getting Started With LTI" 
id: standards-lti-gs-with-lti
categories: Standards
author: Scott Hurrey
---
# Getting Started With LTI
### Overview

Learning Tools Interoperability (LTI) is a standard from the IMS Global consortium.
This standard focuses on contextual launches and grade return. For more
information about the standard, see [Learning Tools
Interoperability](https://imsglobal.org/lti).

Note that Blackboard Learn supports two versions of LTI:  

	1. LTI 1.1  
	2. LTI 1.3/Advantage

This getting started guide is focused on LTI 1.3/Advantage. LTI 1.1 has been deprecated by the IMS Global, and it's been around for over 10 years. If you are building a new tool, please use LTI 1.3/Advantage.

### LTI 1.3/Advantage
The link above takes you to the IMS Global page for LTI Advantage. LTI Advantage consists of the following four specifications:  

	1. LTI Core (AKA LTI 1.3)  
	2. Deep Linking  
	3. Names and Roles  
	4. Assignments and Grades

Additional companion specs will be released as they are developed.

Blackboard Learn supports all of the above LTI Advantage specs, as well as the new Course Group spec which will be published soon.

It is imperative that you read the specs from the IMS Global. They refer to other specifications that LTI Advantage is based on, such as the OIDC specification, JWT, and OAuth 2. We highly recommend you familiarize yourself with these specifications.

Start with the IMS Security Framework here <https://www.imsglobal.org/ims-security-framework>

Continue with the LTI Advantage specs here <https://www.imsglobal.org/activity/learning-tools-interoperability>

You can test your tool with the IMS LTI Reference Implementation here: <https://lti-ri.imsglobal.org/>. It is written in Ruby and is open source.

We have a sample LTI tool written in React and Node.js which we discuss in a later section.

For IMS members there are other LTI resources here: <https://github.com/IMSGlobal/ltibootcamp>

### Registering Your Application
We will go into detail on how to develop an LTI Advantage application in another section, but there are many resources avaiable on how to build an application in the programming language of your choice.

In this section we cover how you register your application with Blackboard and deploy it to a Learn instance. Registration and deployment are not covered in the specification (yet), and each LMS vendor handles it slightly differently.

#### Blackboard Developer Portal
The first thing to understand about registering your application is that Blackboard has you register your tool **ONCE** with our developer portal here <https://developer.blackboard.com>. This is a central, self-service application, running in AWS where you enter information about your application, and are given the values you need for your application to work with LTI Advantage and Learn. It is also the same place you get the ID, key, and secret if you are going to use our public REST API.

**NOTE:** Do not ask institutions to register your tool with the Blackboard Developer Portal. You register it **ONCE** with Blackboard and institutions can deploy it with the Client ID you give them.

#### Information you Provide
##### Domain
We will use the terms `Application` and `Tool` interchangeably throughout this document. What we refer to as an `Application` may be different than how you see it. For Blackboard Learn, an `Application` is a web application, accepting GET and POST requests at a URL. That application is defined by its fully-qualified domain name (FQDN). An application can have many FQDNs, but two applications cannot share the same FQDN. The reason has to do with needing to be able to immport course archives, such as from IMS Common Cartridge. If there are LTI links in that archive the only way we have today to map those links to a particular LTI Application is through domain matching. If that seems like a limitation, please read on.

##### LTI 1.3 Fields
The LTI 1.3 spec defines the information you must provide to a Platform (LMS) such as Blackbaord Learn. Those values are:  

	1. OIDC Login initiation URL - this is the URL that Learn makes a GET request to in order to initiate an LTI launch. Without going into too much detail, the OIDC login establishes the identity of the user launching and you validate that you recognize this person. Due to the way that 3rd-party-initiated logins work in OIDC, you are not given the Client ID, so you must determine that by including a unique registration ID on the OIDC Login URL. What you provide is completely up to you, but it must distinguish a Blackboard login request from a request from any other LMS.  
	2. Tool Redirect URL(s) - This is the URL to which  the LTI launch is POSTed. An LTI launch is a FORM POST with a form parameter named `id_token`. That `id_token` is a JWT that you then parse, verify, and handle. You can provide as many Tool Redirect URLs as you like, separated by commas in the UI, but we strongly recommend you provide only **ONE**. There is enough information in the id_token JWT for you to determine what to do with the LTI launch. Think of your web application as a router for LTI. You may have one or you may have hundreds of "applications" behind that "router", directing LTI launches to their appropriate places.  
	3. Tool JWKS URL - this is the URL for your public key with which Learn validates that the messages it receives (such as Deep Linking, Names & Roles, Assignment & Grades) are from your application. It must adhere to the JWKS specification.  
	4. Signing Algorithm - Blackboard currently supports RS256 and RS512. We can support more as we are requested to do so.

##### Custom Parameters
The LTI spec supports the notion of custom parameters with a launch. These are arbitrary `name=value` tuples that you can provide to uniquely identify the launch, or any other piece of information you need from the platform at launch time. See the following two documents on how to use substitution parameters within custom parameters to receive context-specific data on an LTI launch:  

[IMS LTI 1.3 Parameter Substitution](https://www.imsglobal.org/spec/lti/v1p3/#customproperty)  
[Blackboard Learn Template Variables](https://docs.blackboard.com/learn/b2/advanced/dynamic-rendering-with-template-variables.html)
	
#### Information you Receive
Once you have registered your application with the Blackboard Developer Portal, you will receive [almost] all the information you need to configuration your application to receive LTI 1.3 launches from a Blackboard Learn instance.  

 	1. Application ID - this is the same as the Client ID in the OIDC spec. Because we already had the concept of registering an application for using our public REST API, and we use the same UI to register for both, we call it Application ID in some places, and Client ID in others. We apologize in advance for the confusion this causes.  
 	2. Issuer - is always `https://blackboard.com` because Blackboard is issuing the credentials
 	3. Public keyset URL - Blackboard's public JWKS URL so you can validate the signature of messages a Learn instance sends you  
 	4. Auth token endpoint - the endpoint you use to get an OAuth 2 Bearer Token if you wish to make service calls, such as Assignment & Grades, or Names & Roles back to Learn
 	5. OIDC auth request endpoint - the endpoint you respond to after you receive an OIDC login initiation request from Learn.

**NOTE:** You will also receive an application key and secret. These are your credentials for using our public REST API. Be sure to save these off as you won't be able to get back at them later. We do not store the secret on our side.

### LTI Placements
In Blackboard Learn the way an LTI tool is surfaced in the user interface (UI) is through the definition of one or more `Placements`. An application developer can define these placements so a Learn admin doesn't have to. There are currently six types of placements you can create:

| Type | Description | Options |
| ---- | ----------- | ------- |
| Deep Linking | Supports [LTI Deep Linking](https://www.imsglobal.org/spec/lti-dl/v2p0) to get content in outline or editor | Allow student access |
| Course Content | Can be placed in the course outline or editor | Can be graded |
| Course | Appears in Ultra Books & Tools, Original Tools | Allow student access |
| System | Appears in Ultra Base Nav Tools, Original Institution module | |
| Admin | Appears in Admin Tools module | |
| UEF | Special type for extending the Ultra UI; see [UEF docs](https://docs.blackboard.com/learn/uef/getting-started) | |

#### Placement properties
In the table above some placements allow you to control whether students have access or not. Some placements allow you to configure if it can be graded or not. All placements have the following properties in common:

* Name - up to 255 characters
* Description - up to 

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

Deleting a registered LTI domain and/or the associated managed placements from the Administrator Panel -> LTI Tool Providers page will invalidate all of the associated LTI launch links in courses. The data will be gone from the database. There is no way to fix this. NEVER delete a registered domain or managed placements without considering these consequences. If you create an LTI 1.3 Tool that uses the same domain as a currently registered LTI 1.1 tool on a Learn system, there is code in Learn that will prompt you to migrate from LTI 1.1 to LTI 1.3. Generally that's a great option. Finally, only very brave people make changes on a production system without testing first on a test or staging system. We recommend you be more cautious than brave.``