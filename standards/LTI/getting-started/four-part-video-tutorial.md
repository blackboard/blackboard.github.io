---
layout: post
title: "LTI 1.3/Advantage - 4-Part Webinar" 
id: standards-lti-gs-four-part-video
categories: Standards
author: Mark Bykerk Kauffman
---
# LTI 1.3/Advantage in Learn - 4-Part Webinar
## Overview

This document contains links to a complete demonstration of setting up and using https://github.com/blackboard/BBDN-LTI-Tool-Provider-Node. Shout out to Scott Hurrey & Eric Preston and the team (everyone you see on the commit list at the repo!) for all their work and help with this. 

### Getting Started

The most important thing you can do to begin is to read, and understand [the specification](https://www.imsglobal.org/lti-advantage-overview). We STRONGLY encourage you to join the IMS. There are many members-only resources.


### Video Part I.

[Video Part I is a demonstration](https://onblackboard-my.sharepoint.com/:v:/g/personal/mark_kauffman_blackboard_com/EX7cJ3I7jzROutlbjgk9GzQBHs7Y57lqK3RcDBDZHIUPLA?e=TGb1Em) of setting up and running https://github.com/blackboard/BBDN-LTI-Tool-Provider-Node on your local box to use SSL. Prerequisite: Follow ALL OF THE INSTRUCTIONS in the README of the git repo to clone a local copy and **set up Redis.**  
 
### Video Part II.
[Video Part II demonstrates](https://onblackboard-my.sharepoint.com/:v:/g/personal/mark_kauffman_blackboard_com/EUopuue_7P9Etmq2iDG76IsBBNdHuhldhYT3jN40PChnOg?e=qTnL7Z) registration of your local copy of BBDN-LTI-Tool-Provider-Node (BLTPN) on the developer portal and using the values from the registration to configure your local BLTPN.

### Video Part III.
[Video Part III demonstrates](https://onblackboard-my.sharepoint.com/:v:/g/personal/mark_kauffman_blackboard_com/Ef6HQLoSGnhPmc69e3FpaE0Bkf-I-phSn7e_YFqeKlwccA?e=OmWDXK) use of the 1.3 Tool in Learn, creating a deep-linking managed placement, using the link to create content with the BLTPN tool. Near the end of the video we look at how to use LTI 1.3 Names and Roles to get all of the users in the course from which the link was clicked/launched.

### Video Part IV.
[Video Part IV is a demonstration](https://onblackboard-my.sharepoint.com/:v:/g/personal/mark_kauffman_blackboard_com/EcXwlQwksXxFrA4ZjSy3ZsIBeA4_NVORxjoZ1BlLThpQxA?e=VKgRMd) of custom parameters from the Deep Link launch request and also a review of Names and Roles in that request.

The purpose of Names and Roles is to let the Tool Provider get all of the memberships in the course, and the role of each member with a call to one endpoint using LTI 1.3 security. Comming soon: A screenshot of how this looks from the BLTPN - showing the first two members and their roles that were retrieved from the course.
