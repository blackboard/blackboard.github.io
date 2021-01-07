---
layout: post
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

The answer is yes! [Here's a video explaining exactly how to proceed](https://onblackboard-my.sharepoint.com/personal/mark_kauffman_blackboard_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fmark%5Fkauffman%5Fblackboard%5Fcom%2FDocuments%2FSnagit%2F2021%2D01%2D06%5F13%2D12%2D55%2ESystemRoleCourseOrgEnrollmentsOnly%2Emp4&parent=%2Fpersonal%2Fmark%5Fkauffman%5Fblackboard%5Fcom%2FDocuments%2FSnagit&originalPath=aHR0cHM6Ly9vbmJsYWNrYm9hcmQtbXkuc2hhcmVwb2ludC5jb20vOnY6L2cvcGVyc29uYWwvbWFya19rYXVmZm1hbl9ibGFja2JvYXJkX2NvbS9FY3p0UFJhUlhyOUVnVzlrRFRjbk4zRUJGSWJPdWlfbzVGdVRSY0o0d2F0UV9BP3J0aW1lPVl1MU1McWl5MkVn).

Reference Documentation:

* [https://docs.blackboard.com/learn/rest/getting-started/rest-and-learn](https://docs.blackboard.com/learn/rest/getting-started/rest-and-learn])
* [https://docs.blackboard.com/learn/rest/getting-started/basic-authentication](https://docs.blackboard.com/learn/rest/getting-started/basic-authentication)
* [https://docs.blackboard.com/learn/rest/getting-started/3lo](https://docs.blackboard.com/learn/rest/getting-started/3lo)
* [https://github.com/Kong/mashape-oauth/blob/master/FLOWS.md](https://github.com/Kong/mashape-oauth/blob/master/FLOWS.md)
* [https://docs.blackboard.com/learn/rest/getting-started/tutorials](https://docs.blackboard.com/learn/rest/getting-started/tutorials)
* [Bookmarklet to help map entitlements to permissions](https://community.blackboard.com/blogs/4/18)