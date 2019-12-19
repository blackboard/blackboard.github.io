---
layout: learn
parent: soap
category: tutorials-soap
---
# SOAP Web Services Sample Code: Build Java Client Library
*Author: Scott Hurrey*  
*Categories: ['Getting Started', 'SOAP Web Services', 'Tutorials']*  
*Tags: ['web services', 'soap', 'java', 'tutorial', 'blackboard learn', 'sample code', 'developer']*  
<hr />

The Blackboard Learn SOAP Web Services come out of the box with [sample
code](About%20Web%20Services%20Sample%20Code.html) that can be downloaded
directly from the user interface. This document will describe the process by
which a developer can build the java client library contained within that
code.

# Caveat

The file that you download from Learn containing all of the sample code is
called client.zip, so when you unzip it, it will be called client. This is
referred to as the top-level client directory in this document. This document
specifically deals with a subfolder of that directory, which is also called
client. When top-level client directory is specified, this refers to
`_/path/client_`. When top-level is not specified, it refers to
`_/path/client/client_`.

# Preparing the Development Environment

This sample code was initially built when Blackboard Learn 9.1 was released
several years ago. As a result, it is dependent upon some older technology. It
is suggested that the technologies installed for this tutorial be segmented
for this purpose.

Library | Download Link | Comments  
---|---|---
Ant 1.6 | [apache-ant-1.6.0-bin.zip](https://archive.apache.org/dist/ant/binaries/apache-ant-1.6.0-bin.zip) |
SED |  | If building on Windows, you must install sed, either stand-alone, or from cygwin
Java |  | Script tested on Java 7, should work with Java 8
Axis2 1.3 | [axis2-1.3-bin.zip](https://archive.apache.org/dist/ws/axis2/1_3/axis2-1.3-bin.zip) |
Axis2 1.3 Source | [axis2-1.3-src.zip](https://archive.apache.org/dist/ws/axis2/1_3/axis2-1.3-src.zip) | 
Rampart 1.4 | [rampart-dist-1.4-bin.zip](https://archive.apache.org/dist/ws/rampart/1_4/rampart-dist-1.4-bin.zip) | In order to set the development environment up with these technologies without overriding newer versions that may be being used in other projects, it is recommended that a separate directory be set up in the top-level client directory and environment variables be temporarily pointed to them. In this example, a tools directory has been added to the client directory, an Ant, Axis, and Rampart were unzipped here.

Now open a terminal or .html window, and navigate to the client directory, by
typing: **_cd <pathtodirectory>/client/client_ **and pressing <ENTER>. You
should now be in the client directory.

We will need three environment variables to be set: JAVA_HOME, AXIS2_HOME,
ANT_HOME. JAVA_HOME should be set to point to your JDK installation. This is
probably already set. To verify, type: **_echo $JAVA_HOME_** and press
<ENTER>. AXIS2_HOME, should be set to the path to Axis 2 where you just
installed it. In our example, it would be _client/tools/axis2-1.3_. Lastly,
ANT_HOME should be set to the Ant directory you just installed. In this
example, ANT_HOME would be set equal to _client/tools/apache-ant-1.6.0_.

The next step is to configure axis2 for building the sample code. To do this,
we must copy a few files from rampart, and modify one file. In our example, we
would copy all the jar files in _client/tools/rampart-1.4/lib_ to
_client/tools/axis2-1.3/lib_. Then we must copy
_client/tools/rampart-1.4/modules/rampart-1.4.mar_ to
_client/tools/axis2-1.3/repository/modules_ directory. In the same directory
you copied the mar file to, there is a file called _modules.list_. You must
edit this file and add rampart-1.4.mar to the bottom of the list and save it.
The last step is optional, and that is to create a subdirectory to _axis2-1.3_
called _src_, and download the axis2 source here. This is not required for the
build to work, but if you will be debugging your code in Eclipse, this will
allow you to follow the code into Axis2.

Now your development environment is all set to generate the code and build the
Java Web Services Library.

# Building the Library

The first step is to generate the code. This is done at the command line and
in the _client/client_ directory. Simply run _**sampleGenClient.[.html|sh]
<your learn server>. There are two caveats
here. Firstly, if you are running this on Mac or Linux, the
_sampleGenClient.sh_ file contains Windows ctrl-M line endings. This will
cause the script to fail. The easiest way to fix this is to use sed `sed -e
"s/^M//" sampleGenClient.sh > sampleGenClient1.sh)`. Please note that the ^M
actually refers to the control character, so to enter, you will need to hold
down the ctrl key and press v and then m. The second caveat is that this file
will fail if you use `https://` and building against a self-signed certificate
like the Developer Virtual Machine. Just use
`http://`.

You will now end up with a _generated-src_ directory. You can build the
library using ant, by simply typing **_$ANT_HOME/bin/ant build_** and pressing
<ENTER>. You will now have _client/client/lib/wsc.client.jar_.

