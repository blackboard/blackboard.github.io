---
layout: post
title: "Getting Started"
status: deprecated
id: archive-soap-gs-first-steps
categories: Learn soap
author: Scott Hurrey
---

# Getting Started

Blackboard Learn offers documentation and sample code for the SOAP-based Web
Services directly in the user interface. The sample code gives you the ability
to create re-usable libraries in both C# and Java. Once you build this
library, you can import it into your IDE of choice and start writing code
against them without having to solve the intricacies of Learn’s Web Service
implementation or the WS-Security headers needed to interact with them.

Also included in the source code is a fully functioning QA Desktop
Application, which can be built in C#. Once built, you can test every Web
Service Blackboard Learn offers with your mouse. In addition, there is a
sample “Hello World” custom Web Service. Part of the Web Services framework
allows you to create a customized web service to interact with data not
available through the standard web service offering, but taking advantage of
the security framework provided therein.

To access the sample code and documentation, simply login to your Blackboard
Learn instance and navigate to the System Admin Page. In the Building Block
module, you will see a link for Web Services. Clicking this link takes you to
the management interface for the Web Services. On the right hand side of the
action bar, you will see buttons to download the Documentation and the Source
Code.

Of course, the real benefit of Web Services is that you can choose your
development environment, language of choice, and you have full control over
the code. You can modify your integration any time, without requiring the
Blackboard System Administrator to change or schedule anything.

### Notes

- Blackboard's SOAP Web Services implement WS-Security to authorize incoming messages. The way this works is fairly straight forward. The first step is to call ContextWS.initialize(). In the message payload, you will have a SOAP Header and it must contain a WS-Security tag -- <wsse> in this example -- and in that section, you will need a <username> tag set equal to "session", and a <password> tag set equal to "nosession". This method will return a session id and for the rest of the session, you will send <wsse:username>session</wsse:username> and <wsse:password>_the session id returned from initialize_</wsse:password>.
- The basic workflow is: ContextWS.intialize(), ContextWS.login(...) or ContextWS.loginTool(...), Initialize the services you need to access, call the methods you need, ContextWS.logout(). To see examples, check the [Examples](examples) pages.
- All of the Web Services have their own initialize method. The names vary from service-to-service, but with the exception of ContextWS, they all take a boolean argument called ignore. This argument was added simply because the .NET sample code generator doesn't work without those methods having at least one argument. Its called ignore, because it is ignored, so you set it to true or false without affecting anything.
