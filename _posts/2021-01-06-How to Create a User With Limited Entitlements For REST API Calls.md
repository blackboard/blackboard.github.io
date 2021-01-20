---
layout: blog
title: How to Create a User With Limited Entitlements For REST API Calls
date: 2021-01-06 12:59
category: announcement
id: 20210106-howtocreatelimiteduser
author: Mark Kauffman
tags: ['rest', 'learn', 'api']
summary: How to Create a User With Limited Entitlements For REST API Calls
---

# How to Create a User With Limited Entitlements For REST API Calls

First, as our documentation states, a Blackboard Learn admin should never be told to associate a user with Learn admin privileges with any REST API integration, see this document. Hence we often get questions from folks on how to create a user to associate with a REST API integration that has limited capability on a Learn system. One way is to research and design your REST application to use OAuth 2 3-legged Authentication. See the documents referenced below. 3LO guarentees that the user using your REST Application can only do what they can do via the Learn UX when they are logged into Learn.

However, if your application is using our OAuth 2 2-legged Authentication read on. Or I should say, watch on. I created the following to answer the question "Is it possible to create a user that has only the necessary permissions and avoid using "blackboard admin" user?"

The answer is yes! [Here's a video explaining exactly how to proceed](https://youtu.be/uyKdbCpcZMc).

Reference Documentation:

* [https://docs.blackboard.com/learn/rest/getting-started/rest-and-learn](https://docs.blackboard.com/learn/rest/getting-started/rest-and-learn])
* [https://docs.blackboard.com/learn/rest/getting-started/basic-authentication](https://docs.blackboard.com/learn/rest/getting-started/basic-authentication)
* [https://docs.blackboard.com/learn/rest/getting-started/3lo](https://docs.blackboard.com/learn/rest/getting-started/3lo)
* [https://github.com/Kong/mashape-oauth/blob/master/FLOWS.md](https://github.com/Kong/mashape-oauth/blob/master/FLOWS.md)
* [https://docs.blackboard.com/learn/rest/getting-started/tutorials](https://docs.blackboard.com/learn/rest/getting-started/tutorials)
* [Bookmarklet to help map entitlements to permissions](https://community.blackboard.com/blogs/4/18)