---
layout: post
title: "Getting Started With Caliper"
categories: Standards Caliper Getting Started
id: caliper-gs-getting_started
author: Scott Hurrey
---

# Getting Started With Caliper

Caliper Analytics is an IMS Global standard focused on the delivery of
consistent event tracking across campus applications.

For more information on
the Caliper Analytics specification, visit the IMS site [here](https://www.imsglobal.org/caliper).

Caliper is implemented in Learn as the Learn Activity Stream. This
data is stored in an external system called the Caliper Event Store. This
server lives in the Cloud and is not externally accessible at this
time. As a result of its location in the Cloud, it is also only currently
available on Learn SaaS deployments. The data is then used to fuel
Activity Reports in the context of Learn. These are currently
available for Learn Assignments, Assessments, and Kaltura Media
assignments when using Kaltura’s LTI integration and Learn SaaS.

For more information on Kaltura integrations, visit the Kaltura web site [here](https://corp.kaltura.com/Video-Solutions/Teaching-and-Learning).

From a Developer standpoint, Caliper is available in two ways: sending events
to the Learn Activity Stream, and subscribing to the 
Learn Activity Stream as an additional Event Store. This section of the
Anthology standards Developer Community will dive into both of these options,
with sample code and supporting documentation.
