# Blackboard Learn for REST and LTI Developers AMI Life Cycle
*Author: Mark O'Neil*  
*Categories: []*  
*Tags: ['ami', 'developer ami', 'blackboard rest and lti developer ami', 'developer']*  
<hr />
This document provides a listing of available Blackboard Learn for REST and
LTI Developers AMIs.

## Overview

The Blackboard REST and LTI Developer Amazon Machine Image ("AMI") is an image
of a Blackboard Learn server available in the [Amazon
Marketplace](https://aws.amazon.com/marketplace/pp/B077T4SX2B).
The AMI allows a developer to spin up a copy of Blackboard Learn for building
applications that use the REST APIs and/or Learning Tool Interoperability
("LTI") to integrate with Learn. This image is a standalone copy of the SaaS
deployment of Blackboard Learn that allows development and testing against the
Ultra user experience. Once the developer spins up the copy of Learn, it lives
in his or her AWS account and the developer has full control over the instance
of Learn. All instances are pre-licensed with a developer license. New
developer AMIs will be made available in the same cadence as SaaS releases.*
We also make available an AMI for our 9.1 hosted releases that is made
available in the same cadence as our hosted releases.

The below table provides a listing of available releases. The AWS Subscription
Availability column indicates the approximate date on which the AMI will be
removed from the AWS Marketplace - if you have subscribed your subscription is
valid until the license expires after which you will no longer be able to
restart the EC2.

Note: beginning in the June, with the exception of Bi-annual releases,
subscription availability for AMIs will expire on next SaaS release. Bi-annual
subscription availability expires when version is no longer supported (~two
major releases post initial release). Licenses for releases are valid for
minimally 100 days after subscription removal.

### Learn Version

**(bold indicates a bi-annual release e.g. 3700.0.0 is Q2 2019)**

| Version        | AMI Target Release Date | AWS Subscription Expires | License Expiration Date |
| -------------- |:-----------------------:|:------------------------:|:-----------------------:|
| **3400.0.0**   | **30-Apr-2018**         | **20-Oct-2019**          | **23-May-2020**         |
| **3500.0.0**   | **05-Oct-2018**         | **04-May-2019**          | **14-Nov-2020**         |
| **3700.0.0**   | **29-Mar-2019**         | **06-March-2021**        | **04-June-2021**        |
| 3700.9.0       | 05-Sept-2019            | 03-Oct-2019              | Jan-2021                |
| **3800.0.0**   | **03-Oct-2019**         | **Oct-2021**             | **Apr-2022**            |

_* While we strive to release AMIs close to Blackboard Learn SaaS and Hosted
releases, in some cases the AMI may be released up to two weeks after
production Learn releases._

