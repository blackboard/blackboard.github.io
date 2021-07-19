---
layout: post
title: "B2s and Java Permissions"
categories: Learn b2
id: learn-b2-advced-java-permissions
author: Scott Hurrey
status: deprecated
---

# B2s and Java Permissions

Building Blocks are basically web applications which run in the Blackboard
Learn web application container. As such they require specific permissions
added to their bb-manifest.xml file to properly install, display, retrieve and
persist data, and correctly operate within the Learn application and
environment.

In order to interact with the Learn environment a Building Block must supply
the necessary set of java permissions in the permissions element located near
the bottom of the bb-manifest file. A basic set of permissions may include:

```java
    <permission type="attribute" name="user.personalinfo" actions="get,set"/>
    <permission type="blackboard.persist.PersistPermission" name="user" actions="create,modify"/>
    <permission type="java.net.SocketPermission" name="*" actions="resolve,connect"/>
    <permission type="java.util.PropertyPermission" name="*" actions="read,write"/>
```

One permission often seen is:

```java
    <permission type="java.io.FilePermission" name="&lt;&lt;ALL FILES&gt;&gt;" actions="read,write"/>
```

While convenient to use this particular 'wild card' notation, it provides
access to all system files. Thus it is more secure to specify files and paths
directly even if this requires multiple permission entries:

```java
    <permission type="java.io.FilePermission" name="BB_HOME/logs/my_b2.log" actions="read,write"/>
```

A more comprehensive though not all-inclusive set of permissions is listed at
the end of this help topic.

### How do I know which permissions to include?

Unfortunately **_AccessControlException<_** are not discoverable at compile-
time as they only manifest when a Building Block is running. So beyond the
common permissions noted above, exceptions may be determined by coding
practices or by log entry identification. When an installed Building Block
encounters a permissions gap at runtime it will throw an
**_AccessControlException_** permission error. You may use this error to
determine the exact permission you need to add to the bb-manifest to correct
the **_AccessControlException_** condition.

The main indication of an **_AccessControlException_** is receiving error 404
when launching your Building Block. This 404 error indicates that the resource
is unavailable. This 404 error is a good indication that the Building Block is
missing a required permission. The next step is to identify the missing
permission.

Using Linux as an example, inspect the
/usr/local/blackboard/logs/tomcat/stdout-stderr-xxxxxxxx-log.txt, where
xxxxxxxx is the date when the error appeared. Search this log for
**_AccessControlException_** and you should find something like this:

Caused by: java.security.**_AccessControlException_**: access denied
(java.net.SocketPermission tup6.temple.edu resolve)

This is the logged exception and follows the pattern of:

```java
Caused by: java.security.**_AccessControlException_**: access denied (<type> <name> [<actions>])
```

To resolve this error, you simply need to add a new permission element to your
bb-manifest.xml file using the logged <type> <name> and if specified
[<actions>].

The format for the permission element is (notice the same terminology in use):

```java
    <permission type="<type>" name="<name>" actions="<actions>" />
```

Simply enter the values from the error message into the permission element,
add it to your bb-manifest and re-deploy your Building Block. It is important
to note that <actions> is optional. If your error stack doesn’t have <actions>
associated with it, simply leave it blank (i.e. actions="").

To illustrate this, we’ll take the above listed error and convert it into a
permission element.

Thus:

```java
Caused by: java.security.**_AccessControlException_**: access denied
(java.net.SocketPermission tup6.temple.edu resolve)
```

Becomes:

```java
    <permission type=”java.net.SocketPermission” name=”tup6.temple.edu” actions=”resolve” />
```

You will need to re-deploy your Building Block after changing your bb-
manifest. Uninstalling and re-deploying your Building Block or changing the
version number will update the Building Block with the permissions specified
in the bb-manifest. In addition, Blackboard Learn 9.1 October 2014 Release
requires a system restart in order to implement the new changes in
permissions.

### More Permissions

Below are some additional permissions for formatting reference.

Do not include more permissions than are necessary for proper operation of
your Building Block as this will impact start times.

```java
    <permission type="blackboard.data.AttributePermission" name="sessionmanager" actions="get" />
    <permission type="attribute" name="user.personalinfo" actions="get,set" />
    <permission type="persist" name="groupmembership" actions="create" />
    <permission type="attribute" name="user.authinfo" actions="get" />
    <permission type="java.util.PropertyPermission" name="*" actions="read,write" /> 
    <permission type="persist" name="content" actions="persist" />
    <permission type="persist" name="course" actions="create,modify,delete" /> 
    <permission type="persist" name="user" actions="create,modify,delete" />
    <permission type="persist" name="userrole" actions="create,modify,delete" />
    <permission type="persist" name="coursemembership" actions="persist,create,modify,delete" />             
    <permission type="persist" name="enrollment" actions="persist,create,modify,delete" />
    <permission type="attribute" name="enrollment.rowstatus" actions="get,set" />             
    <!-- Minimum permissions to support Spring -->
    <permission type="java.lang.reflect.ReflectPermission" name="suppressAccessChecks" />
    <permission type="java.lang.RuntimePermission" name="accessDeclaredMembers" />
    <permission type="java.lang.RuntimePermission" name="createClassLoader" />
    <permission type="java.lang.RuntimePermission" name="setContextClassLoader" />             
    <!--  For logback logging -->
    <permission type="java.io.FilePermission" name="${java.home}/lib/*" actions="read" />
    <permission type="java.io.FilePermission" name="BB_HOME/logs/-" actions="read,write" />
```
