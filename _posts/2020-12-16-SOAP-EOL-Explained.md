---
layout: post
title: SOAP EOL Explained
date: 2020-12-16 12:00
category: blog
post_id: 20201216-soapeolexplained
author: Mark Kauffman
tags: ["soap", "learn", "eol", "api"]
summary: In January 4, 2019 Blackboard announced deprecation of our SOAP Web Services
---

# SOAP EOL Explained

Back in the day, January 4, 2019 to be exact, Blackboard announced deprecation of our SOAP Web Services with this article [Blackboard SOAP Web Services Deprecation](https://blackboard.secure.force.com/publickbarticleview?id=kA039000000Tm3cCAC&homepage=true)

Now, almost two years later in our [Learn SaaS Relase Notes](https://help.blackboard.com/Learn/Administrator/SaaS/Release_Notes) we've written "As of December 31, 2020, Learn SOAP Web Services are no longer supported, as they have reached the end of life per our deprecation policy." What does this mean for you as a develoepr?

The most common concern is "Will my SOAP code continue to work in an earlier version of Learn?" or some variation. Here's a recent example: "Will this be for all versions, or will SOAP API still be available on version 3800?"

The answer is that client's self and manged-hosted systems that are on older versions of Learn will not be impacted. If your client is runnign 3800.0.3 and upgrades to the most recent Cumulative Update, the SOAP Webservices should continue to work for them.

For self and managed-hosted clients that are on 3900.0.0 and are now upgrading using the same build numbers as in SaaS, SOAP will not be supported in any release post Dec 31, 2020.

Another common quesiton is from those using the Learn LIS 2.0 SIS integration, which is SOAP based. No, we are keeping the LIS 2.0 SIS integration in the product at this time. It will not be affected.

If you have additional questions, drop a line to developers@blackboard.com and we'll update this blog post with the answer.

Happy 2021!
