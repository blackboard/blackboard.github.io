---
layout: post
title: "Rest registry"
id: rest-apis-learn-admin-cloud_registry
categories: Learn Rest
author: Scott Hurrey
status: deprecated
pdf: true
geometry: "left=2cm,right=2cm,top=2cm,bottom=2.5cm"
header-includes:
    - \usepackage{fvextra}
    - \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\}}
    - \usepackage[obeyspaces,spaces,hyphens]{xurl}
---
<!-- BOF PDF BLOCK -->
<div>&nbsp;</div>
{% assign sluggedName = page.name | replace: '.md' %}
<div class="download-btn-placement"><br>modified: {{ page.last_modified_at | date: '%b-%d-%y' }} &nbsp;&nbsp; 
<a href="/assets/pdfs{{page.dir}}{{sluggedName}}.pdf" target="_blank"><img class="download-button" src="/assets/img/download.png" height="30px"></a></div>
<!-- EOF PDF BLOCK -->

# Register Developer Instances to the Cloud

You must register developer instances of Blackboard Learn to the Blackboard
cloud. This is true of both developer virtual machines (DVM) that you host
locally and AWS cloud-based instances created from the Blackboard Learn AMI.
Use the following steps to register your DVM or AMI.

To register your developer instance to the Blackboard cloud:

Do not select **Move to Production** in the DVM or AMI without guidance to do
so from Blackboard's developer experience team.

1. Log into your developer instance as Administrator. You may be greeted with an first-time user message. You can select **Close** or refresh the page to close it.
2. Select **System Admin**.
3. Select **Cloud Connector** under _Cloud Management_.
4. Provide a **Display Name**.
5. Select an **Instance Type**. For most development work, select **Development**.
6. Select a **Regional Cloud**. This one-time choice indicates the AWS region with which you want to associate your developer instance. Your choice is permanent and irrevocable.
7. Select **Save and Retry** to save the configuration and connect to the Blackboard cloud. In some cases, the developer instance of Learn throws an error explaining that it could not connect to the Blackboard cloud. This behavior is expected. Ignore it.

If you are working with a developer virtual machine (DVM) rather than an AMI,
you may need an SSL connection to register successfully. In these cases, you
receive an error message like the following:

![Screen+Shot+2016-04-24+at+10.50.13.png](/assets/img/cloud-registry-1.png)

If you see this error message, try connecting to the Virtual Machine at
[https://localhost:9877](https://localhost:9877/)and following the steps above. This should allow you to register to the cloud and then you should be able to use it in non-SSL mode.