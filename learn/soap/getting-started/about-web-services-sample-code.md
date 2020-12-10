---
layout: post
title: "About Web Services Sample Code"
status: deprecated
id: learn-soap-gs-about-web-services-sc
categories: Learn Soap
author: Scott Hurrey
---
# About Web Services Sample Code

Blackboard Learn provides access to sample code to help Developers build
against the Blackboard Web Services. This sample code is accessible directly
from the Blackboard Learn User Interface. The download comes in the form of a
zip archive and contains a number of build-able projects. These projects can
be re-used in conjunction with the license contained in the root directory of
the zip archive.

### How To Get It

Any user with access to the Web Services section of the System Administrator
panel can download the Web Services Sample Code and Javadoc-based Web Services
API documentation.

#### Sample Code Contents

Name |Description
--- | ---
[client](build-sample-client-dotnet) | This directory contains the necessary files to build the wsc.client.jar. This library is required to build the projects in the javaclient and proxy directories included in this package. It can also be used in conjunction with the included license in custom applications. 
[dotnetclient](build-sample-library-dotnet) | This directory contains the necessary files to build the .NET client library. This library is required to build the project located in the qa/dotnet directory included in this package. It can also be used in conjunction with the included license in custom applications.
[javaclient](java-client-library) | The javaclient directory contains the code necessary to build a java-based Web Services client.
LICENSE_for_samples.txt | This file explains the re-use and licensing policy associate with the sample code
proxy | The code in this directory can be used to build a java-based proxy Server
[qa](build-sample-client-dotnet) | The qa directory contains the code necessary to build a fully-functioning .NET based desktop application. From this program, you can test every API available through the core Web Services.
readme.txt | The readme.txt outlines the contents of each directory and the path to the readme.txt file for each.
sample_webservice | The Blackboard Web Services contain a number of the most popular integration points available in the Building Block framework, but not all. As a result, Blackboard Learn allows for the inclusion of custom web services to be created and added into the existing Web Services framework. A sample “hello world” web service is included in this package.
b2client | A sample Building Block that utilizes the web services directly in the Java Virtual Machine, bypassing the SOAP Layer.