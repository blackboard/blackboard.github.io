---
layout: post
title: "Groups, Site quotas and rate limits"
id: rest_apis-learn-admin-group_quotas_rates
categories: Learn REST
author: Ryan Haber
doctitle: "Developer Groups, Site quotas and Rate limits"
pdf: true
geometry: "left=2cm,right=2cm,top=2cm,bottom=2.5cm"
header-includes: |
  \usepackage{fvextra}
  \usepackage[obeyspaces,spaces,hyphens]{xurl}
  \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\}}
  \usepackage{hyperref}
---

{% assign sluggedName = page.name | replace: '.md' %}
# Developer Groups, Site quotas and Rate limits <a href="/assets/pdfs{{page.dir}}{{sluggedName}}.pdf" target="_blank"><img class="download-button" src="/assets/img/download.png" height="30px"></a> 

## Overview

With the Blackboard Developer Portal, you can manage use of your Learn
instance's REST APIs and applications that use those APIs. Groups of
developers work on one or more applications and each group is subject to a
limit on the number of sites that can use their applications and the number of
API requests their applications can make daily.

**Note:** If you are a Blackboard client, a Blackboard Partner / Vendor / Developer of a REST Application should NEVER tell you to go to the developer portal and create an App ID with the associated key/secret to install their application. They should never tell you to apply for a Rate/Site increase for their application. Blackboard DOES NOT support that model. Every REST Application developer should give you an App ID to install their REST App and tell you how to configure a system role for its use. Period. The REST Application developer needs to request the increases they need to run their application themselves. If they ask you to go to developer.anthology.com and get an App ID/Key/Secret, please tell them that is wrong. They should have exactly one App ID for their production REST application that they are asking you to install.

Contractors are an exception to this policy as they are producing an
integration on your, the Blackboard client, behalf. Questions regarding the
policy and whether you are impacted may be asked here, or posted to
[developers@anthology.com](mailto:developers@anthology.com).

> Rate Limits: By default you get 10.000 calls every 24 hours per site. If you need more, follow the instructions in last two sections of this page.

### Developer Groups

You manage control of an application using developer groups. When you create
your login on the developer portal, you also create a group of one that
includes only yourself and is named after you. You can create more groups on
the **My Groups** page. You can add other registered users to your groups.

When you create an application, you assign it to a group, and members of that
group can access it.

Before moving to production, you must designate one group as the production
group. The best practice is to name your production group after your
organization. [See the Group Naming Requirements in this document for further details](/rest-apis/learn/admin/production-groups).

Each developer group is subject to maximum site quotas and to daily limits on
the number of API requests made. These limits start relatively low because
they are intended for development and testing only. To qualify for production-
level site quotas and rate limits, you must designate a production group. To
designate one of your groups as a production follow the steps provided at the
end of this document. For more information about using, managing, and naming
groups, see [Developer Portal Development and Production Groups](/rest-apis/learn/admin/production-groups)

### Production Groups

To move into production and allow your application to be used more widely,
**you** must create a production group. You create the group then tell
Blackboard what that group name is following the process given at the bottom
of this document. A developer group is designated as a production group when
you name it after your company using initial upper-case camel case, e.g.,
YourCompanyName. The production group name identifies your REST application to
the Learn administrator when they install your application.

### Site Quotas

Each developer group has a quota of the maximum number of Learn
sites that can access the group's applications, regardless of number of
applications. You are responsible for keeping track of the sites where your
Learn REST Application is installed. If a client attempts to install your REST
application but the site quota is exceeded for the developer group that
manages it, the client will get an error message when they try to install it.
The error message typically reads something like _Failure: Application
developer has exceeded maximum number of client installations. Please contact
the developer._

### Rate Limits

> We provide by default 10.000 calls every 24 hours. If you need more, follow the instructions in last section of this page.

A rate limit is the number of API requests that can come each day from
applications that are registered to your developer group. For example, if you
have a 100K limit and three applications, each application will use a portion
of that 100K limit. *Your application should monitor the number of requests used so far at an
application level using the http headers provided in each request response.* Inform your user when your application stops or is about to stop working because it hit the rate limit.

| HTTP Header            | Description                                                                  |
| ---------------------- | ---------------------------------------------------------------------------- |
| X-Rate-Limit-Limit     | The rate limit ceiling for the given development group                       |
| X-Rate-Limit-Remaining | The number of requests left for the 24-hour period for the development group |
| X-Rate-Limit-Reset     | The remaining time before the rate limit resets, given in UTC epoch seconds  |

### Increasing Site Quota and Rate Limits

If you are a Blackboard partner or licensed client when you need to increase
the site quota and rate limit for your production group, **please open a
ticket on Behind the Blackboard**. Provide the following in your request:

- **Production group name**. Designate one of your groups as a production group if
  you haven’t. Follow the process described above for creating the group name.
  This should be your CamelCaseCompanyName. Tell us the name in the ticket.
- **Developer email that owns the production group**. One of your developers
  created the account that is creating REST API apps and groups on
  developer.anthology.com. When that developer creates your
  CamelCaseCompanyName production group, that developer's email is the
  "Developer email" referenced here.
- A description of the application, both what it does and which APIs used.

If you are an open-initiative developer please make your request by email to
[developers@anthology.com](mailto:developers@anthology.com). In your
request, provide the same information as indicated above.
