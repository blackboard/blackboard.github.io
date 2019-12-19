---
layout: collab
title: Blackboard Collaborate
---
# Getting Started With The Blackboard Collaborate REST APIs
*Author: Scott Hurrey*  
*Categories: ['Getting Started']*  
*Tags: ['developer', 'getting started', 'collaborate', 'blackboard', 'developers']*  
<hr />
<p>This section is dedicated to getting developers up-to-speed quickly with the
new REST APIs available for Blackboard Collaborate with the Ultra Experience.
These APIs give the developer the ability to programmatically integrate common
Collaborate functionality into a web application using the tried and true
framework that is REST APIs.</p> 
  
<p>Getting started requires a few key decisions on the developer's part. Firstly,
the Developer should decide what programming language best meets the use cases
required for the application to be successful. Every language has strengths
and weaknesses, and with a little research, one can balance ease of use,
performance, security, and existing frameworks and packages to build the best
integration possible. Secondly, the developer should review the API
documentation to ensure that the APIs exist to accomplish those goals. Lastly,
the Developer must decide if this work is best completed in-house or via an
engagement with Blackboard Collaborate's consulting group. Often times,
consulting is a great option for building an integration based on best
practices developed over many years of experience integrating with Blackboard
Collaborate.</p>

## Requesting Access

If you are interested in getting started with the Development of integrations
with Blackboard Collaborate Ultra, send an email to
[developers@blackboard.com](mailto:developers@blackboard.com). Please tell us
who you are, what institution you represent, and how you intend to use the
APIs.

## Authorization and Authentication

Generally speaking, REST API integrations are largely the same. That is the
beauty of REST; the developer has a standard set of HTTP Verbs that generally
perform the same actions, return the same success and failure codes, and most
languages provide software packages and add-ons that make REST calls simple.
Usually, the main hurdle is two-fold: What is the business logic behind the
APIs, and how does an application authenticate to the services in order to
send the REST calls necessary to perform the actions required.


Most REST frameworks rely on some facet of the OAuth 2.0 standard and
Blackboard Collaborate is no different. Collaborate relies on JSON Web Tokens
(JWT) in order to accept the application as a trusted entity. For more
detailed information about the JWT Standard and to learn about available
libraries for most of today's popular web application development languages,
see https://jwt.io. For more information on Blackboard
Collaborate's implementation see [Authorize and Authenticate in Blackboard
Collaborate](Authorize%20and%20Authenticate%20in%20Blackboard%20Collaborate.html).

## Examples

It is true that REST APIs allow the developer to choose any programming
language that supports HTTP calls. That said, there are some languages that
are consistently at the top of the list. As part of the effort to assist
Developers in getting up and running, Blackboard typically offers sample code
and supporting documentation in a number of those popular languages:

  * [Postman Collection](https://github.com/blackboard/BBDN-Collab-Postman-REST)
  * Java
  * [Python](https://github.com/blackboard/BBDN-Collab-REST-Demo-Python)
  * Ruby
  * PHP
  * C#/.NET
  * Node.JS

As these samples are developed, the language above will be linked.

## Tutorials

The community site will also provide tutorials for how to perform specific
actions necessary to get up and running in the Collaborate integration game.
As those assets are developed, they will be listed here.

