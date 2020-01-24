---
layout: learn
parent: b2s
category: best-practices-b2
---
# Preparing Your Building Blocks For Learn SaaS and Newer Learn Versions
*Author: Scott Hurrey*  
*Categories: ['Building Blocks', 'Tutorials']*  
*Tags: ['building blocks', 'blackboard learn', 'saas', 'learn', 'b2', 'building block', 'prepare', 'requirements', 'developer']*  
<hr />
Blackboard Building Blocks have long been a staple in the Blackboard Learn
platform. These Java Web Apps allow you to customize the workflow and
experience that you and your faculty use to interact with the system.

We realize that this is an important part of the Learn ecosystem, and so
Blackboard Learn SaaS with the Original Experience will continue to support
your Building Blocks going forward*****. That said, the architecture of the
SaaS-delivered platform is dramatically different than that of the self- and
managed-hosted servers you are used to. As a result, your Building Block will
likely need to be modified to run in the new Blackboard.

**The following sections list requirements that must be met for a B2 to function in a SaaS environment**. For example, your B2 must be compiled with Java 8, the database may be Postgres so the best practice is to use Schema.xml, the shared content must be accessed as described below, etc. Many of these are also requirements for a B2 to function on Learn Q2 2016 (3000.x.x) and Q4 2016 (3100.x.x). The best practice is to code to meet all of these requirements, then your B2 will function on SaaS, Managed Hosted, and Self Hosted systems.

***Note:** Building Blocks cannot surface content in an Ultra course, **ever**. B2s meant designed to work with Original Experience courses can continue to work in SaaS, provided they meet the requirements documented here. Ultra Courses surface content from the Content Market - which are built on Partner Cloud, or the LTI standard & Blackboard Learn REST APIs.

  * [APIs](#apis)
  * [Database](#database)
  * [Shared Content Folder](#shared-content-folder)
  * [Logging Changes](#logging-changes)
  * [Statelessness](#statelessness)
  * [Java 11](#java-11)
  * [Tomcat 8](#tomcat-8)
    * [JSP Precompilation](#jsp-precompilation)
    * [bb-context-config.properties](#bb-context-config.properties)
      * [com.blackboard.tomcat.servletcontainer.jarscanner.tldJars](#com.blackboard.tomcat.servletcontainer.jarscanner.tldJars)
      * [com.blackboard.tomcat.servletcontainer.jarscanner.pluggabilityJars](#com.blackboard.tomcat.servletcontainer.jarscanner.pluggabilityJars)
      * [com.blackboard.tomcat.servletcontainer.context.containerSciFilter](#com.blackboard.tomcat.servletcontainer.context.containerSciFilter)
      * [com.blackboard.tomcat.servletcontainer.context.processTldsOnStartup](#com.blackboard.tomcat.servletcontainer.context.processTldsOnStartup)
    * [web.xml](#web.xml)
      * [Faster Startup](#faster-startup)
    * [URL Encoding](#url-encoding)
  * [Permissions](#permissions)
  * [Original UI](#original-ui)
  * [Ultra UI](#ultra-ui)
  * [Continuous Delivery](#continuous-delivery)
  * [Installing Building Blocks in Learn SaaS](#installing-building-blocks-in-learn-saas)

# APIs

Only use the [published
APIs](Building%20Block%20API%10Documentation). If it's not published, it's private. Our product development
team is cleaning up and refactoring a lot of code. If you're using private
APIs, there is a good chance they will stop working. So, remove all use of
private APIs. For example we've discovered that B2s that depend on
**DocumentManagerEx** now fail in newer versions of Learn.
**DocumentManagerEx** is private. Don't use it. Eliminate the use of all
private APIs.

# Database

In SaaS, the database schema name will no longer be **BBLEARN** or
**bb_bb60**. Your B2 code must determine the actual schema name if it has any
dependency on the value. See [Bye Bye BBLEARN & bb_bb60](https://community.blackboard.com/blogs/4/23)

Also, in SaaS, the database is Postgres. If you’ve been testing your code on
the Developer Virtual Machine, this isn’t that big of a deal. Schema.xml will
continue to be supported as it is today. If you are providing SQL statements
in the form of stored procedures, post_schema_updates, etc, you will just need
to be sure to supply those files in postgres form, as well. These files will
take the suffix, **db-pgsql**. If a self or managed-hosted client is migrating
your B2 to SaaS via a "full database migration" be certain to read [SaaS
Migrations - Sequences and Tables](https://community.blackboard.com/blogs/4/24).

In addition, its important to note that Exceptions encountered during postgres
transactions stop all processing. You must code to handle this occurrence. One
approach is to create a save point before you start the transaction and roll
back to that save point upon exception. Here’s a small sample demonstrating
this.
```
// Much of the error handling stripped for space

public static T withSavePoint(Callable c, Connection con) throws SQLException
{
  Savepoint savepoint = null;

  try {
    if ( null != con && !con.getAutoCommit() ) {
      savepoint = con.setSavepoint();
    }

    return c.call();
  } catch ( SQLException e ) {
    if ( con != null && savepoint != null ) {
      con.rollback( savepoint );
    }
    throw e;
  }
}
```

Postgres handles timestamps differently. There are two types of timestamps:
**localtimestamp** and **clock_timestamp::timestamp**. The **localtimestamp**
returns the time at the start of the transaction. The
**clock_timestamp()::timestamp** returns the actual current time. As a result,
it is best practice to use **clock_timestamp()::timestamp** in your Building
Block, as this matches the behavior of timestamps in other databases.

Avoid the use of **data-templates** for management of objects that can be
managed through the bb-manifest.xml file. This includes rows in tables like
application, navigation_item, and entitlements. The use of data-templates both
adds risk to live-upgrades and loses customizations (application status,
entitlement-to-role mappings, etc.).

# Shared Content Folder

In the Enterprise Blackboard Learn you are accustomed to developing for, the
Building Block home lives in the shared content directory. For instance, if I
wrote a building block and set my vendor ID to ‘bbdn’ and my plugin handle to
‘my-b2’, my building block and all of its related files would live in
**blackboard/content/vi/BBLEARN/plugins/bbdn-my-b2**, and this directory would
exist once, in only one place, so changes were persisted to all application
servers.

In Learn SaaS, there are two building block homes. There is still the shared
file system that is shared among the entire group of application servers, but
there is also a local cache on each individual server. As a result, the
Building Block would still reside in the shared directory, similar to
**blackboard/content/vi/BBLEARN/plugins/bbdn-my-b2**, however the web app
would live in the local cache on each server, in a directory similar to
**blackboard/cache/vi/BBLEARN/plugins/bbdn-my-b2**.

As a result of this change, several of the Plugin API methods have been
modified to handle the dual-folder deployment.
**PlugInManager.getPlugInDir()** and **PlugInManager.getPluginsDirectory()**
can now only be used to access the read-only files from the exploded war in
the cache folder. If you need to access the shared config folder for your
Building Block, you can use **PlugInUtil.getConfigDirectory()**. Calling
methods like **ServletContent.getRealPath()** will point to the cache folder,
so be sure that any method you are calling that returns a path or a file is
returning what you expect it to.

As an example, with prior versions of Learn you could use the following code
to write to a file in your plugin’s folder and create a configuration file:
```
PlugInManager manager = PlugInManagerFactory.getInstance();
File myDir = manager.getPlugInDir( manager.getPlugIn( "myVendorId","myB2Handle" ) );
File myConfigDir = new File( myDir, "config" );
File myConfigFile = new File( myConfigDir, "config.txt" );

// read/write myConfigFile
```

You will now need to re-write the above code code to look like the following:
```
File myConfigDir = PlugInUtil.getConfigDirectory( "myVendorId", "myB2Handle");
File myConfigFile = new File(myConfigDir, “config.txt”);

// read/write myConfigFile
```

If you just need to read from a file that is included with in your Building
Block, you can use the following code snippet to access the cached copy.
```
PlugInManager manager = PlugInManagerFactory.getInstance();
File myDir = manager.getPlugInDir( manager.getPlugIn( "myVendorId","myB2Handle" ) );
File myStaticDirectory = new File (myDir, "webapp/myStaticStuff");

// read from myStaticDirectory - files as originally present in war file
```

See the bb-config.properties section in [Developer Virtual Machine - DVM](/Developer%20Versions%20of%20Blackboard%20Applications/Developer%20Virtual%20Machine%20-%20DVM.html) for how to configure your DVM to behave like Learn SaaS in regards to the
shared content folder.

Eventually, all write access to the shared folder will be phased out, and
write access for logging will be limited to the log directory returned by
PlugInUtil.getLogDirectory(). Prior to this change, a new way will be
documented to achieve the same goal without writing directly to the backend of
the server.

# Logging Changes

In SaaS, logging is handled a bit differently, as clients will not have back-
end access to the system. You can still log to the log directory, but those
logs are redirected to Kibana so your Building Block won’t be able to read
that log file. There will be access to the logs through the System Admin
panel.

In order to see your B2s logs in Kibana-Elasticsearch, the only SaaS interface
for log files, your B2 must do the following:

  1. Write the log files to the directory returned by **blackboard.platform.plugin.PlugInUtil.getLogDirectory.**[**PlugInUtil** (Building Blocks API 3000.1.0)](https://library.blackboard.com/ref/16ce28ed-bbca-4c63-8a85-8427e135a710/blackboard/platform/plugin/PlugInUtil.html)
     1. Typically looks like **<blackboard home>/logs/plugins/<vendorId>-<handle>/...**
     2. Read the API documentation on how to get write permission.  

  2. Use this format, with four columns that are pipe separated:  
```
2016-03-15 01:00:00 | DEBUG | 41:c.b.c.i.task.UsageReportingTask | Generating Usage Report...
2016-03-15 01:00:00 | ERROR | 68:o.s.s.support.MethodInvokingRunnable | Invocation of method 'doUsageReport' on target class ...failed
java.lang.NullPointerException: null
  at com.blackboard.consulting.internships.task.UsageReportingTask.getFirstTimeActivationDateModified(UsageReportingTask.java:68)
```

The b2 logging configuration in the logback.xml file that produces this log
format is:
```
<appender ... >

...

<encoder>

<pattern>%date{yyyy-MM-dd HH:mm:ss} | %-5level | %-45(%L:%logger{40}) |
%m%n%ex{10}</pattern>

</encoder>

...

</appender>
```

**[Sample logging code that works in a SaaS environment.](https://github.com/mark-b-kauffman/bbdn-bblogbackb2)**

# Statelessness

The Learn SaaS cloud architecture is built to the best practices of cloud
computing. As such, in SaaS, Learn is stateless. As a result, you can no
longer rely on **HttpSession** persisting across requests. As a result,
Building Blocks that synchronize data on sessions will need to be refactored.
You can still use **BbSession.setGlobalKey()** to store data, but you will
need to be cognizant of the size of the data, as this is stored in the
database.

As an example, if you currently employ code like the following to store an
object in the session:
```
request.getSession().setAttribute( "myKey", "myValue" );
request.getSession().setAttribute( "myObjectKey", myObject );
```

You will need to refactor to look like this:
```
ContextManagerFactory.getInstance().getContext().getSession().setGlobalKey("myVendorId.myB2Handle.myKey", "myValue" );
```

Non-String values need to be serialized to save on the **BbSession** -
refactor to avoid if at all possible.

# Java 11

Blackboard Learn SaaS runs on Java 11, as of Learn 3800. As a result, Building Block that are to
be installed in the cloud, or on 9.1 Q2 2020 or later, need to be built with
Java 11. For more information see [8 steos to prepare for Java 11](8%20steps%20to%20prepare%20for%20Java%2011.html).

# Tomcat 8

Tomcat 8 introduces a few new complexities to the Building Block development
process. This move was an opportunity to re-imagine how the Learn application
startup performance could be improved. This work has been extremely
successful, but requires some refactoring of your code.

## JSP Precompilation

It is expected that going forward, all Building Blocks will precompile JSPs.
This simple step will assure that your JSP files render properly in Blackboard
Learn. All bundled Building Blocks are required to take this step, while
currently optional, this could become mandatory in the future.

This blog post describes one way to [precompile you Java Server Pages](https://community/blackboard.com/blogs/4/25) when using Gradle.

## bb-context-config.properties

Tomcat 8.5 is substantially more configurable in the way that you can
implement [jar scanning](https://tomcat.apache.org/tomcat-8.5-doc/config/jar-scanner.html). This file lives in the WEB-INF directory of your Building Block
and provides the following options:

### com.blackboard.tomcat.servletcontainer.jarscanner.tldJars

Because you should be precompiling your JSP files, this will normally be left
blank. If on-demand JSP compilation is used, this may be set to a Java regular
expression of jar file names. You should only include the jar files containing
the TLD files needed by the non-compiled JSP files. The patter can include the
template variable _@CORE_TLD_PATTERN@_, which will resolve to a regular
expression matching all Blackboard jar files containing TLDs.

Here are a few examples:

  * **RECOMMENDED**: Building Block uses several Blackboard Tag Libraries  
```
com.blackboard.tomcat.servletcontainer.jarscanner.tldJars=@CORE_TLD_PATTERN@
```
  * Default  
```
com.blackboard.tomcat.servletcontainer.jarscanner.tldJars=
```

  * Building Block uses Struts and the bbNG Tags  
```

com.blackboard.tomcat.servletcontainer.jarscanner.tldJars=bb-
taglibs.jar|struts-taglib-.*\\.jar
```

  * Building Block uses several Blackboard libraries and Struts  
```
com.blackboard.tomcat.servletcontainer.jarscanner.tldJars=@CORE_TLD_PATTERN@|s
truts-taglib-.*\\.jar
```

### com.blackboard.tomcat.servletcontainer.jarscanner.pluggabilityJars

Set this to a Java regular expression of jar file names that contain web
fragments, ServletContainerInitializers (SCIs), and other classes with
annotations defined in the Servlet 3.1 specifications if they are used by the
Building Block.The pattern can contain the template variable
_@CORE_PLUGGABILITY_PATTERN@_, which will resolve to a regular expression that
matches all Blackboard jar files containing such components.

Here is an example:

  * A Building Block contains classes that implement Spring's WebApplicationInitializer  
```
com.blackboard.tomcat.servletcontainer.jarscanner.pluggabilityJars=spring-
web-.*\\.jar
```

### com.blackboard.tomcat.servletcontainer.context.containerSciFilter

This Java regular expression should list all SCIs in the CLASSPATH that are
**not** used by the Building Block. The default value is **^.*$**, which
matches ALL SCIs and assumes that the Building Block does not use any.

Examples:

  * Building Block does not use SCIs and does not have any uncompiled jsps  
```
com.blackboard.tomcat.servletcontainer.context.containerSciFilter=^.*$
```

  * If for some reason, your JSP is not compiled, use  
```
com.blackboard.tomcat.servletcontainer.context.containerSciFilter=^.*(?<!\\.JasperInitializer)$
```

  * If the JSPs are compiled, but your code relies on classes that implement Spring's WebAppplicationInitializer  
```
com.blackboard.tomcat.servletcontainer.context.containerSciFilter=^.*(?<!\\.SpringServletContainerInitializer)$
```

### com.blackboard.tomcat.servletcontainer.context.processTldsOnStartup

This is not required to be in the bb-context-config.properties file. You would
include this and set it to true only if the Building Block or one of the jar
files it contains defines a listener in a TLD that the Building Block
requires.
```
com.blackboard.tomcat.servletcontainer.context.processTldsOnStartup=true
```

Here is a final example of a typical /WEB-INF/bb-context-config.properties
file:
```
com.blackboard.tomcat.servletcontainer.jarscanner.tldJars=
com.blackboard.tomcat.servletcontainer.jarscanner.pluggabilityJars=
com.blackboard.tomcat.servletcontainer.context.containerSciFilter=^.*$
```

If you see errors like:
```
Unable to compile <myclass> root cause:
INFO | jvm 1 | 2018/02/06 00:51:17 | java.lang.NullPointerException
INFO | jvm 1 | 2018/02/06 00:51:17 | at org.apache.jasper.JspCompilationContex
t.getTldResourcePath(JspCompilationContext.java:566)
INFO | jvm 1 | 2018/02/06 00:51:17 | at
org.apache.jasper.compiler.Parser.parseTaglibDirective
```

try adding making your bb-config-context.properties file look like this:
```
com.blackboard.tomcat.servletcontainer.jarscanner.tldJars=@CORE_TLD_PATTERN@
com.blackboard.tomcat.servletcontainer.jarscanner.pluggabilityJars=
com.blackboard.tomcat.servletcontainer.context.containerSciFilter=^.*(?<!\\.JasperInitializer)$
```

## web.xml

Your Building Block should be using Web App version 3.0, and requires
metadata-complete to be set. By default and in most cases, this should be set
to **true** for best performance. Set this to **false** ONLY if your Building
Block uses annotation-based web_xml extensions as defined in the Servlet 3.1
specification or if your jar files should be scanned for web-fragment.xml.
These are some of the annotations that require the metadata-complete attribute
to be set to false:

  * WebServlet
  * WebFilter
  * WebInitParam
  * WebListener
  * MultipartConfig
  * ServletSecurity
  * HttpConstraint
  * HttpMethodConstraint
  * DeclareRoles
  * EJB
  * EJBs
  * Resource
  * Resources
  * PersistenceContext
  * PersistentContexts
  * PersistenceUnit
  * PersistenceUnits
  * PostConstruct
  * PreDestroy
  * RunAs
  * WebServiceRef
  * WebServiceRefs

Some of these annotations, like PostContruct, PreDestroy, and Resource, only
require the setting to be false if they are placed in an object whose life-
cycle is managed by the container, such as a Servlet or a Listener.

Here is an example of what this will look like in your web.xml file:
```
<web-app 
  xmlns="[http://java.sun.com/xml/ns/javaee](https://community.blackboa
rd.com/external-link.jspa?url=http%3A//java.sun.com/xml/ns/javaee)"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-
app_3_0.xsd"

version="3.0" metadata-complete="true">
```

In addition to metadata-complete, another new tag should be included at the
end of the web.xml file: absolute-ordering. Generally, this should be an empty
tag for best performance. If web fragments are used, the ones that are
required should be listed explicitly her to to avoid unnecessary
initialization of other unused fragments in the class path.

For example:

  * The Building Block does NOT use web fragments  
```
<absolute-ordering/>
```

  * The Building block uses web fragments from the spring-web jar  
```
<absolute-ordering>
  <name>spring_web</name>
</absolute-ordering>
```

### Faster Startup

When declaring servlets in web.xml, the <load-on-startup> tag allows you to
decide when a servlet is loaded into memory. The default value is to load at
first access, but that is not always appropriate for every situation. The
following table illustrates the tags and their meanings. Be sure to select the
one that is right for your Building Block.

Tag Value | Description
---|---
<load-on-startup>1</load-on-startup> | Load the servlet during system initialization.
<load-on-startup>-1</load-on-startup> | Load the servlet the first time it is accessed.
<load-on-startup>-9876</load-on-startup> | Load the servlet immediately following the Learn system initialization

Be sure to evaluate your individual integration before deferring your startup.
If this or another Building Block depends on the servlet code being registered
or if this servlet must be live prior to the system starting for user access,
deferring startup is not appropriate.

Deferring all of your servlets to load immediately following system startup
will definitely make the system available to users more quickly, though one
should note that those user requests might be a bit slower as all of the
servlets are starting. In addition, it is important to note that should a user
access a servlet that has been deferred and not yet started, it will load at
that time, so there is no risk of a servlet being unavailable should the
process still be underway.

If you are executing other startup logic inside something such as a
ServletContextListener's contextInitialized method and that logic is not 100%
required to be executed before user activity then please defer it by calling
ContextInitThreadRunner.startThread(Thread) or .startDaemonThread(Thread).

Here is a snippet from the Javadoc explaining this method:
```
/**

* This method can be used in place of thread.start() when you are starting a thread typically during system startup

* and you do not absolutely NEED that thread to start immediately. Once the system has completed normal startup of

* all webapps (b2s) and is ready to accept requests, any threads registered via this method will be started. <br>

* <br>

* It is safe to call this at any point in time though - if the server has already started then this will merely start
* the thread.<br>`

* <br>

* The reason we are doing this is to make sure all resources can be
dedicated to pure startup tasks and not diverted

* to 'background' activity, thus getting the system to a ready state a bit
faster.

*/
```

## URL Encoding

Tomcat 8.5.12 and later releases of Tomcat 8.5.x by default does not allow
curly braces ( { } ) or vertical bars, often referred to as pipes ( | ) in
URLs. For backward compatibility, [Tomcat provides a way to override this
behavior](https://tomcat.apache.org/tomcat-8.5-doc/config/systemprops.html) by allowing
a system property tomcat.util.http.parser.HttpParser.requestTargetAllow to be
defined. Please be advised that this exposes the application to a [known
security issue](https://nvd.nist.gov/vuln/detail/CVE-2016-6816).

Future versions of Tomcat may not support this override. Therefore, all B2s
must url-encode these characters. For example, an URL like `http://myuniversity.blackboard.com/webapps/myb2/appController?options={x|y}` must be written by the application as `http://myuniversity.blackboard.com/webapps/myb2/appController?options=%7bx%7cy%7d`. Otherwise, Tomcat will reject the request.

# Permissions

As Blackboard continues to modernize the Blackboard Learn platform and move
services out of the Learn code line and into microservices, the need to secure
the application from both accidental and malicious actions, the properties
granted to Building Block integrations is necessarily tightening. This is
being addressed in a phased manner, with the intent of providing third-party
developers ample runway for adjusting to the new restrictions. As new
restrictions are added, this page will list them, so be sure you are following
this page to receive updates.

Permission | Mitigating Factors | Current Action**
---|---|---
java.security.AllPermission |  | Filtered Out 
java.lang.RuntimePermission | createSecurityManager, setSecurityManager | Filtered Out
java.lang.RuntimePermission | action implying createSecurityManager or setSecurityManager | Warning Message
java.util.PropertyPermission | write | Warning Message
java.io.FilePermission | ALL FILES | Warning Message

Many Building Blocks rely on the ALL FILES permission for writing to the file
system. This will be filtered out soon. The Building Block should request
explicit file system permissions and utilize the advice in this guide when
writing to log files and config directories. To illustrate the change, here is
an example of a bad permission and a good permission for writing to a log file
from a Building Block.

# BAD
```
<permission type="java.io.FilePermission"name="&lt;&lt;ALLFILES&gt;&gt;" actions="read,write,delete,wxecute"/>
```

# GOOD 
( A couple examples. See [ALL FILES No More](https://community.blackboard.com/blogs/4/26) for a full set.)
```
<permission type="java.io.FilePermission" name="BB_HOME/-" actions="read,write,delete"/>
<permission type="java.io.FilePermission" name="BB_HOME/logs/" actions="read,write,delete"/>
```
# Original UI

Original courses run in an iframe on Learn SaaS. This shouldn’t affect your
Building Block, except in the two following cases:

  * If you set **top.document.location** or **top.location.href** or any other similar settings that change the top page for the browser, your Building Block will not display properly. You can use **window.location** instead.
  * HTML form tags with **target="_top"**, or **target="_blank"** will break out of the Ultra Original course peek panel. Change these to **target="_self"**.
  * To meet accepted best practices in web design, there is a new maximum browser width of **1920px**. Make sure you plan accordingly.
  * B2s using the bbUI and bbData tag libraries should be refactored were at all possible to use bbNG.


# Ultra UI

There are currently no extension points for Building Blocks in the Ultra UI.


# Continuous Delivery

Blackboard strives to deliver updates every two weeks. As a result, you should
be using only public APIs whenever possible, as the continuous delivery model,
coupled with the possibility of undocumented private API changes without
warning, makes using private APIs extremely risky.


# Installing Building Blocks in Learn SaaS

There is no way to install a Building Block in Learn SaaS, regardless of the
User Interface you are using. If you have licensed Learn SaaS Plus or
Advantage, you do have the ability to install Building Blocks, but you must
work with support to schedule the installation

