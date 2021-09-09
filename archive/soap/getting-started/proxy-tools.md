---
layout: post
title: "Proxy Tools"
status: deprecated
id: archive-soap-gs-proxy-tools
categories: Learn soap
author: Scott Hurrey
---

# Proxy Tools

Administrators can link to a proxy tool descriptor which registers the tool,
places access points according to defined properties, and enables access to
the web service through the proxy tool.

Before registering a proxy tool, there are three _Global Properties_ to keep
in mind:

- Use the _Proxy Tool Registration Password_ field to restrict access to the _registerTool_ method. Proxy tools that must supply the password entered in this filed to register themselves. The proxy tool cannot login as a tool until a password is specified on the proxy tool configuration page. Proxy tools cannot receive any entitlements until granted by giving the individual proxy tool its own password.
- Allowing access to _Unknown Proxy Tools_ means that these proxy tools can connect and use user-based authentication to access web services. A password is required and access is restricted based on the users' entitlements within the system. Access for unknown proxy tools can be accomplished without explicitly granting them the right to use web services.
- _Exposing the Tool Consumer Profile_ allows proxy tools to auto-discover the capabilities of the system by using the URL _/webapps/ws/wsadmin/tcprofile_. Disabling this does not disable proxy tools, but it disables their ability to perform pre-registration capability validation.

#### Find the Proxy Tools Page

1. On the Administrator Panel, in the _Building Blocks_ section, click _Building Blocks_.
2. Click _Proxy Tools_.

### Manage Global Properties for Proxy Tools

Use the Proxy Tool Registration Password field to restrict access to the
registerTool method. Proxy tools that must supply the password entered in this
filed to register themselves. The proxy tool cannot login as a tool until a
password is specified on the proxy tool configuration page. Proxy tools cannot
receive any entitlements until granted by giving the individual proxy tool its
own password.

Allowing access to Unknown Proxy Tools means that these proxy tools can
connect and use user-based authentication to access web services. A password
is required and access is restricted based on the users entitlements within
the system. Access for unknown proxy tools can be accomplished without
explicitly granting them the right to use web services.

Exposing the Tool Consumer Profile allows proxy tools to auto-discover the
capabilities of the system by using the URL /webapps/ws/wsadmin/tcprofile.
Disabling this does not disable proxy tools, but it disables their ability to
perform pre-registration capability validation.

1. Click _Manage Global Properties._
2. Provide or edit the _Proxy Tool Registration Password_.
3. Select the _Allow Unknown Proxy Tool_ check box if appropriate.
4. Select the _Expose Tool Consumer Profile_ if appropriate.
5. Click _Submit_.

#### Register a Proxy Tool without Placements

1. In the _Register Proxy Tool_ list, click _Create Proxy Tool without Placements_.
2. Provide the _Vendor \_and \_Program_ information.
3. Determine the _Availability \_of the proxy tool by clicking \_Unavailable_ or _Available_. If the proxy tool is not _Available_, then it cannot log in to any web service using any authentication methods in addition to having any requested placements disabled.
4. Provide a _Shared Password_. The _Shared Password_ is required only for tool-authenticated web service sessions.
5. Provide individual IP addresses or a range of IP addresses to allow or block in the _IP Filters_ field. Type one address per line. Using IP Filters is optional and all IP addresses are allowed by default (ALLOW\*). Here are some guidelines for using the IP Filters:


    * Type BLOCK a.b.c.d to block an IP address or range of addresses.
    * Type ALLOW a.b.c.d to allow an IP address or range of addresses.
    * Wildcards (*) are allowed in any position of the IP address.
    * IP address ranges are specified using a slash as follows: a.b.c.d/e.f.g.h

6. Click _Submit_.

#### Register a Proxy Tool with Placements

1. In the _Register Proxy Tool_ list, click _Create Proxy Tool with Placements_.
2. In the _Known Servers_ list, select a Proxy Server and click _Go_. Provide the registration URL for the proxy server in the _Server Registration URL_ field. Use the full path for the URL furnished by the proxy tool vendor.
3. Click _Submit_.

#### Edit a Proxy Tool

1. Access a proxy tool's contextual menu and click _Edit_.
2. Make changes to any of the fields.
3. Click _Submit_.

#### Delete a Proxy Tool

1. Access the proxy tool's contextual menu and click Delete.

-OR-

2. Select the check boxes for the appropriate proxy tools, and then click Delete.

#### Download Sample Tools

1. Click _Download Sample Tools_.
2. Click \_OK \_to accept the download of a ZIP file containing sample proxy tools.

#### What's in the Sample Tools Package

The ZIP file contains the following sample tools:

- .NET-based Proxy Tool
- Java-based Proxy Tool
- Java-based Proxy Server

**Note**: Consult the README and the LICENSE_for_samples files before using the sample tools. The most current information is included in these files and may supersede this documentation
