---
layout: post
title: "LTI Advantage - Names and Roles" 
id: standards-lti-tutorials-names-and-roles
categories: Standards
author: Scott Hurrey
---

# LTI Advantage - Names and Roles
### Overview

This document documents gives updates on Names and Roles as new features become available. For the definitive specifications, always refer to the published IMS documenation.

### Student Preview User Now Indicated By TestUser Role via Names and Roles Service
This new functionality is seen in the Names and Roles service as implemented in Blackboard Learn. When your LTI 1.3 tool reaches back to Blackboard Learn using the Names and Roles service to get a list of memberships, a Student Preview user listed in the course memberships will have a new role listed in the roles claim. Ex

~~~ http
"https://purl.imsglobal.org/spec/lti/claim/roles": [
    "http://purl.imsglobal.org/vocab/lti/system/person#TestUser"
  ],
~~~
As of this writing, 2020.04.07, this addition to the Names and Roles service has not yet been added to the IMS Names and Role Provisioning Services documentation. It will likely be added as an addendum soon.