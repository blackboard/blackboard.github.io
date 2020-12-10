---
layout: post
title: "Getting Started" 
id: ally-getting-started
categories: Ally
author: Scott Hurrey
---
# Getting Started Developing for Ally as a Service
Ally as a Service provides separatly licensed, stand-alone API access to allow an application to process files for accessibility. Many of you are using this power in your LMS to help instructors improve the accessibility of their content, and to give students, regardless of ability, access to the content that meets their needs and learning style the best. 

To get started, the first thing you need is a client ID, key, and secret.  At this time, the best way to obtain this information is to engage your Account Executive to discuss pricing and request credentials. As the API continues to grow, this process may change, so be sure to check back here often. 

Once you have your key and secret, the first step in any REST integration framework is typically to learn how to authenticate and authorize your application. Ally as a Service uses JSON Web Tokens (JWT) in order to generate a token, which is then used as a Bearer token in the Authorization header of each request.

Click here to learn more about [authorization and authentication](auth) for Ally as a Service.

There are a number of ways to test out the API. The easiest is to use the [Ally as a Service API documentation](api). You can enter your client ID and your secret, and then interact with the available API directly from the documentation. 

Click here to learn more about [using the API documentation](about-api-documentation) in this way.

Here are the operations currently available in the API (each page has a sample cURL command at the bottom):
* [Upload a file to Ally](/ally/uploadfile.html)
* [Check the processing status for a file](/ally/checkstatus.html)
* [Retrieve the feedback for the file](/ally/getfeedback.html)

This list is ever growing, so be sure to check back often to get the latest list of functionality available.

### Tutorials and Examples
As we create tutorials and sample code, we will list them here. 
* [Ally as a Service API documentation](https://ally.ac/api/) - Includes sample cURL Commands
* [Postman Collection](https://github.com/blackboard/BBDN-AaaS-Postman)
* [Python](https://github.com/blackboard/BBDN-AaaS-Python)
