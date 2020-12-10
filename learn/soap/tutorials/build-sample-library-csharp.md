---
layout: post
title: "Build The .Net SOAP Sample Library"
status: deprecated
id: learn-soap-tutorials-build-a-sample-library-c
categories: Learn soap
author: Scott Hurrey
---
# Build The .Net SOAP Sample Library

The first step to building the .NET Web Services sample desktop application is
to build the library that handles the communication between that client and
Blackboard Learn. This library can also be used from within Microsoft™ Visual
Studio® to build custom applications, without having to build the
communication protocols. If you choose to build your own, you have access to
all of the code used herein.

### Prerequisites

  * Microsoft™ [Web Services Extensions 2.0 Service Pack 3](https://www.microsoft.com/downloads/details.aspx%3FFamilyID%3D1ba1f631-c3e7-420a-bc1e-ef18bab66122%26DisplayLang%3Den)
  * [Client.zip](about-web-services-sample-code) archive from the Blackboard Learn User Interface
  * Web Services are [Available and Discoverable](https://help.blackboard.com/en-us/Learn/9.1_2014_04/Administrator/070_Server_Management_and_Integrations/System_Integration/Integration_Development/030_Web_Services)

### Assumptions

  * This sample was written based on instructions for Microsoft™ Visual Studio® 2010 Express Edition. There is sample code specific to several versions of Visual Studio, so some steps may vary slightly. The most fluid item is the location of wsdl.exe.
  * This seems to change depending upon the version of Microsoft™Windows® and the version of Visual Studio installed. The path to this file is required to generate the sample code used to build this library.
  * That said, there is no known restriction as to which version of Microsoft Visual Studio you use. Using a version other than the versions that Blackboard supplies specific solutions for may require additional configuration changes to build the software.

### Build It

The sample code must be built from the command line. To access the command
line in Microsoft Windows, click on the ‘Start’ menu, click run, type .html and
click ok. Once you are at the command prompt, navigate to the dotnetclient
sub-directory where you unzipped the client.zip file.

In this directory, you will see a file called sampleGenClient..html. Edit this
file in your favorite text editor. When this script is executed, it will reach
out to your Blackboard instance and retrieve the wsdl for each of the
available web services in order to generate the code. This requires access to
the wsdl.exe executable that is part of the Microsoft Visual Studio
Installation. This is set in the sampleGenClient..html file.

Locate the line in the file that reads set DOTNETBIN= and set it to the
appropriate path. Do not include wsdl.exe in the path. This will be appended
by the script. This file may be located in several locations depending upon
the version of Visual Studio and Windows. You might find this file in the
following locations.

OS | Application | WSDL.exe Location
---|---|---
Windows 7 | Visual Studio 2010 Express | C:\Program Files\Microsoft SDKs\Windows\v6.0A\bin
Windows Server 2008 R2 | Visual Studio 2010 Express | C:\Program Files (x86)\Microsoft SDKs\Windows\v7.0A\Bin

Once this edit has been made, save the file. Now from the command line, and in
the dotnetclient directory, type the following:

~~~ bash
    sampleGenClient..html http://<blackboard learn domain>
~~~

WARNING: _You will see error messages similar to the one below. You can safely
ignore these messages._

~~~ bash
    Schema validation warning: Schema item 'element' named 'getServerVersion' from namespace 'http://util.ws.blackboard' is invalid. Namespace 'http://ws.platform.blackboard/xsd' is not available to be referenced in this schema. Schema validation warning: Schema item 'element' named 'getServerVersionResponse' from namespace 'http://util.ws.blackboard' is invalid. Namespace 'http://ws.platform.blackboard/xsd' is not available to be referenced in this schema. Schema validation warning: Schema item 'element' named ‘getDataSourcesResponse' from namespace 'http://util.ws.blackboard' is invalid. Namespace 'http://util.ws.blackboard/xsd' is not available to be referenced in this schema. Schema validation warning: Schema item 'element' named 'checkEntitlement' from namespace 'http://util.ws.blackboard' is invalid. Namespace 'http://ws.platform.blackboard/xsd' is not available to be referenced in this schema. Warning: Schema could not be validated. Class generation may fail or may produce incorrect results. Writing file 'C:\Users\username\Blackboard\Developer Tools\Web Services\dotnetclient\BbWsClient\gen\UtilWS.cs'.
~~~

Once the sample code has been generated, the next step is to build the code
into a re-usable library. To do this, you must first open Microsoft Visual
Studio. Once the application is open, select **_File > Open_** from the menu
and navigate to and open the .../dotnetclient/BbWsClient/BbWsClient2010.sln
file.

If you are going to use this code in a production environment, you will need
to add code to handle load balanced environments. The best way to do this is
to modify the WebserviceWrapper.cs file to add a CookieContainer to each
initialize call.

For example, the initAnnoucement(UsernameToken userToken) method looks like
the following:

~~~ bash
    announcement = new AnnouncementWS();  
    announcement.Url = baseUrl + "/Announcement.WS";   
    announcement.RequestSoapContext.Security.Tokens.Add(userToken);  
~~~

Simply modify the method as illustrated below to enable the cookie container.

~~~ bash
    announcement = new AnnouncementWS();   
    announcement.CookieContainer = new System.Net.CookieContainer();  //HANDLE STICKY COOKIES   
    announcement.Url = baseUrl + "/Announcement.WS";   
    announcement.RequestSoapContext.Security.Tokens.Add(userToken);
~~~

You must make this change to all of the init<WebService> methods you plan to
implement.

Now simply build the project. To do this, right-click the BbWsClient2010
project in the Solution Explorer and select Build from the contextual menu.
This will create the Dynamic Link Library (.dll) file as either
.../dotnetclient/BbWsClient/bin/Debug/BbWsClient.dll or
../dotnetclient/BbWsClient/bin/Release/BbWsClient.dll.

The .dll file can be imported into other projects, or, as you will see in
subsequent help topics, can be added to in order to create custom
applications.

### Gradebook.WS WSDL and Learn October 2014

A bug in the Blackboard Learn 9.1 October 2014 release with the WSDL for
gradebook.ws causes the code generation to fail when trying to ingest the this
WSDL.

For more information and workarounds for this bug, see the Behind the
Blackboard article [Gradebook.WS wsdl not Able to be Consumed due to Invalid
RuntimeException Declaration](https://blackboard.secure.force.com/btbb_articleview?id=kA370000000H5Fc).

If you follow workaround 1, simply change the initial gradebookWS call:

~~~ c
    url = url_header + 'Gradebook.WS?wsdl'
~~~

with this:

~~~ c
    url = 'file:///Users/username/wsdl/Gradebook.xml'
~~~

Just be sure to replace my absolute path to the absolute path on your file
system.

If you follow workaround 2, the code should work as-is.

