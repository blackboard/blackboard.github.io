---
layout: post
title: Cookies and Browsers
date: 2020-10-15 12:00
category: blog
post_id: 20201015-cookiesandbrowsers
author: Eric Preston
tags: ["lti", "learn", "api"]
toc: false
summary: Most people like cookies. Internet browsers used to like cookies, but a lot has changed in the last few years.
---

# Cookies and Browsers

Most people like cookies. Internet browsers used to like cookies, but a lot has changed in the last few years.

We are seeing a lot of applications stop working in some browsers because cookies are not being shared, and this post hopes to help explain why that is happening and what can be done about it.

A web application may set a cookie to track a user’s session. This is very common, however if your web application is going to be hosted in an iframe, then there’s a good chance your cookie won’t be sent back to you. This is because browsers are clamping down on sending “3rd-party” cookies back to applications hosted in an iframe. Note that a 3rd party is a site that is hosted on a domain different than the 1st party, or your web application. The reason is because these cookies can be used for tracking your internet and browsing activity. Safari has disallowed this for years as a user privacy measure.

Another case where cookies aren’t being sent back is during a form POST back to your application. If you set a cookie, then launch to a 3rd party application, if that application does a form POST back to you, the browser will likely not send your cookie back because it is trying to help prevent cross-site request forgery attacks.

Rather than detail all the scenarios and work arounds here I link to two web pages that are immensely helpful in explaining the situation and some possible workarounds.

The TL;DR is if you must set a cookie in your web application, be careful how you configure that cookie’s properties, and understand that at least in Safari, your cookies may not get passed back to you. The other browser makers are going to get as restrictive as Safari soon.

- [Samesite Cookies Explained](https://web.dev/samesite-cookies-explained/)
- [Samesite Cookie Recipes](https://web.dev/samesite-cookie-recipes/)
