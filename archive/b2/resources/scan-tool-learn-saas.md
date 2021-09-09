---
layout: post
title: "Scan tool for Learn SaaS"
purple-text-title: ""
categories: Learn b2
id: archive-b2-resources-scan_tool
author: Scott Hurrey
---

# Building Block Scan Tool for Blackboard Learn

As of Blackboard Learn SaaS version 3700.11.0, including 9.1 Q4 2019 and higher, you now have the ability to
scan any installed Building Block for API changes and readiness for Java 11!

You should ONLY run this on your staging environment. It can be resource-
intensive

The process is really quite simple. The scanning tool can be turned on in a
browser by loading the following URL:

```apiblueprint
https://<your Blackboard domain>/webapps/portal/support.jsp?Action=toggleDevOnlyRestEndpoints
```

The resulting screen will look like this:

![Enable Building Block scan screen](/assets/img/scan-tool-learn-saas-1.png)

Notice the DevOnly endpoint status at the bottom of the screen shot. This is
how you can tell whether you enabled or disabled the scanner.

This endpoint is a toggle; calling it twice will turn it off. This endpoint is
also only valid in your current browser session. If you close the browser, the
scanning tool will be turned off.

Once this is completed, you can scan any currently installed Building Block.
Here are the details:

Endpoint:

```apiblueprint
https://<your Blackboard domain>/learn/api/v1/healthCheck/deepb2s
```

The endpoint takes the following query parameters

| Parameter                    | Description                                              | Example                           |
| ---------------------------- | -------------------------------------------------------- | --------------------------------- |
| handle                       | The plugin handle for the Building Block                 | handle=myB2                       |
| vendor                       | The vendor id for the Building Block                     | vendor=bbdn                       |
| lookAtEverything             | Configure the scanner to check for all options           | lookAtEverything=true             |
| onlyReportDependencyProblems | Only report issues with libraries in use                 | onlyReportDependencyProblems=true |
| skipReportingB2Overrides     | Don't report on methods overridden in the Building Block | skipReportingB2Overrides=true     |
| groupDependencyIssues        | Group dependency issues together                         | groupDependencyIssues=true        |

As an example, to test the building block in our example, you would load the
following URL:

```apiblueprint
https://<your Blackboard domain>/learn/api/v1/healthCheck/deepb2s?handle=myB2&vendor=bbdn&lookAtEverything=true&onlyReportDependencyProblems=true&skipReportingB2Overrides=true&groupDependencyIssues=true
```

The result of loading this endpoint is a JSON body containing information
about the Building Block and any reported discrepancies. Here is an [example](/assets/files/b2-scan-output-example.zip) of the output from running this scanner against the youtube mashup
Building Block.
