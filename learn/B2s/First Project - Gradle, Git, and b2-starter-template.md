---
layout: learn
parent: b2s
category: getting-started-b2
---
# First Project: Gradle, Git, and b2-starter-template
*Author: Scott Hurrey*  
*Categories: ['Building Blocks', 'Getting Started', 'Tutorials']*  
*Tags: ['building blocks', 'git', 'gradle', 'getting started', 'blackboard learn', 'technologies', 'b2-starter-template', 'developer']*  
<hr />
After setting up the development workstation as described in the Development
Workstation topic you may now build your first project based on the Blackboard
basic-b2-template and gradle build environment.

## Start a Gradle Based Project

In this step you will download the Blackboard provided project template, copy
it to a new project directory named after your project, configure the template
to reflect your project requirements by editing the build and bb-manifest.xml
files.

### 'GIT' the basic-b2-template

Blackboard provides a gradle-based template for Building Block development
which is accessible from the Blackboard GitHub project repository:

[https://github.com/blackboard/basic-b2-template](https://github.com/blackboard/basic-b2-template)

There are several ways which you may access the basic-b2-template. Notably:

  * Download a zip file – this works fine if you do not have GIT installed and is available via a link on the project page.
  * Clone the project to your desktop via the GitHub website via a link on the project page.
  * Use the GIT command-line tools to clone and rename the project.
  * In the case of the first two you have to manually copy/rename the directory to reflect your project name. The third approach, the GIT command-line is what is used in this tutorial - note this requires that you have installed GIT on your development workstation.

#### Using GIT command-line tools

The command for cloning a remote GIT repository is

    $ git clone  -o  

So using 'my-gradleB2' as an example the template would be cloned byclone the
template thus:

Using a terminal change to your GIT managed project directory and

    $ git clone https://github.com/blackboard/basic-b2-template.git -o my-gradleB2 my-gradleB2

(re)Initialize your local repository

    $ git init

Add the cloned files to your local git repo

    $ git add -A

#### An important note about GIT

It is all local until it is pushed to the remote repository – add, commit,
remove, branch etc all happen on your local repository.

Only if and only when you push your local repository to the remote do you
impact the remote repository.

### Import the Project Into Your IDE

You have cloned the remote repository and set up a local ‘working directory’
now you need to import the project into your IDE so that you can begin coding.
The basic-b2-template is a gradle project thus so is the clone.

#### NetBeans

NetBeans recognizes and imports gradle projects such as the cloned
basic-b2-template:

  1. Open NetBeans
  2. Select File: Open Project
  3. Navigate to your GIT dev directory and select the project.

NetBeans recognizes and Imports the project with all it’s ‘gradleness intact.’

#### Eclipse

Eclipse with the Gradle plugin (or STS) supports importing Gradle projects via
Import>Gradle>Gradle Project menu.

An Eclipse w/o the Gradle plugin requires the creation of the supporting
Eclipse project files to import the project. This is done by running the
Gradle Eclipse plugin:

    $ gradle eclipse  
       :eclipseClasspath  
       :eclipseJdt  
       :eclipseProject  
       :eclipse  
       BUILD SUCCESSFUL

When the Eclipse plugin successfully completes, import the project as you
would normally using Import>General>Existing Projects into Workspace.

The schema folder in both NetBeans and Eclipse is generated outside the Web
Pages folder – this is a manifestation of the template clone not an Eclipse or
NetBeans issue – just drag it into the Web Pages folder.

### Edit the build.gradle and bb-manifest.xml files

#### build.gradle

The build.gradle file provides the necessary libraries for the build,
dependency management for the project classpath and war file, and the target
settings for maven and deployment of the Building Block. These must be edited
to reflect your project requirements.

You will make edits to three areas of the file:

Term | Definition
---|---
ext or project.ext | this specifies replacement variables for the build
repository | this specifies the location of the maven repository
dependencies | management of project dependencies

#### ext (or project.ext)

Set this section to reflect your remote development settings:

      project.ext {  
         learnVersion = "9.1.110082.0"  
         deployServer = "10.0.1.150"  
         deployInstance = "BBLEARN"  
       }  

Term | Definition
---|---
learnVersion | used in pulling the appropriate library jars for target version
deployServer | the IP or server name for the target development server (add ":<port&rt;" if not served from port 80)
deployInstance | the DB instance for the target development server

#### repository

Set this section to reflect the Learn maven repository:

    repositories {  
       mavenCentral()  
       maven {  
        url "https://maven.blackboard.com/content...ries/releases/"  
       }  
     }  

You may add additional maven repositories:

    maven {...}  
    maven { url https://repo.myinst.edu/mavenrepo }  

#### dependencies

Set this section to reflect project dependencies:

Term | Definition
---|---
providedCompile | required but NOT built into WAR
compile | required AND built into WAR

[Gradle Dependency Management Documentation](https://www.gradle.org/docs/current/userguide/dependency_management.html)

Blackboard jars should always be providedCompile to exclude them from the war
file:
```
    providedCompile( "blackboard.platform:bb-platform:$ext.learnVersion”)  { transitive = false }  
    providedCompile( "blackboard.platform:bb-cms-admin:$ext.learnVersion" ) { transitive = false }   
    providedCompile( "blackboard.platform:bb-taglibs:$ext.learnVersion" ) { transitive = false }  
```

**NOTE: _'transitive' determines whether to pull all related library dependencies onto the build path._**

Supporting Libraries which need to be built into the war are added as
```
‘compile’:

    compile "org.springframework:spring-aop:$ext.springVersion",   
            "com.googlecode.json-simple:json-simple:1.1",   
            "org.codehaus.jackson:jackson-mapper-asl:1.8.5",   
            "commons-logging:commons-logging:1.1.1",   
            "junit:junit:4.5",   
            "org.json:json:20090211"      
```        

Setting transitive to 'true' specifies a dependency that is reconciled by
Gradle and places all libraries required to satisfy the dependencies on the
build path.
```
    compile( "org.hibernate:hibernate-core:$ext.hibernateVersion" ) { transitive = true }
```

### bb-manifest.xml and bb-manifest-en_US.properties

Set up the bb-manifest to meet the requirements for your project.

The basic-b2-template provides the framework of a bb-manifest.xml file which
uses internationalization bundles. There are two files that require editing:

  * bb-manifest.xml
  * bundles/bb-manifest-en_US.properties

Both these files are located in the project WEB-INF directory.

#### bb-manifest.xml

Important: The handle value and vendor id referenced in the bb-manifest should not contain any spaces. Spaces in these values cause major problems. Any B2 containing such will be removed from Blackboard-hosted systems.

The basic-b2-template bb-manifest minimally requires edits to the following
noted areas for use in your cloned project.
```                      
        <name value="b2.name" /> <--- this is changed in bb-manifest-en_US.properties       
        <handle value="template" /> <--- this should be changed to reflect the project name - such as my-gradleB2       
        <description value="b2.description" /> <--- this is changed in bb-manifest-en_US.properties       
        <default-locale value="en_US" /> <--- this may be left unchanged       
        <version value="1.0" /> <--- this may be changed to reflect the extension version       
        <requires>  
            <bbversion value="9.1.110082.0" /> <--- this should be changed to reflect the minimal target Learn version</requires>        
        <vendor>  
            <id value="mnmt" /> <--- this should be changed to a four character id that reflects the extension origin 
            <name value="Monument University" /> <--- this should be changed to the vendor name          
            <url value="http://www.monument.edu/" /> <--- this should be changed to vendor URL         
            <description value="Monument University" /> <--- this should be a brief description of the vendor       
        </vendor>  
```

#### bb-manifest-en_US.properties

Bundle *.properties files provide the means to internationalize the bb-
manifest sections that are visible in the UI and any text that is displayed as
part of the extension's user interface.
```
    b2.name=B2 Template  <--- this should be changed to reflect the name of your extension, such as my-gradleB2   
    b2.description=Simple B2 template for starting new B2 projects.  <--- this should contain a brief description of the extension's function.  
```

### Build and Deploy

Building and deploying is conveniently done via a terminal by running the
gradle deployB2 task from within the top level directory of your project.
```
    $ gradle deployB2  
     :compileJava UP-TO-DATE   
     :processResources UP-TO-DATE  
     :classes UP-TO-DATE  
     :war UP-TO-DATE  
     :deployB2  
     BUILD SUCCESSFUL  
     Total time: 12.423 secs  
```

Note that launching custom tasks may be configurable within your IDE. Adding a
custom task enables a build and deploy cycle to be run entirely from within
the IDE.

## Benefits

### Consistency and Control

Use of Gradle, a VM, and a SCM such as GIT provide a consistent environment
for development – across all projects, while providing a means of managing
your code-base.

### Speed

While average build-times may not significantly decrease, the significant time
savings resulting from improved general project management and from the
deployment feature of the Learn/Gradle dev environment adds up quickly when
compared to a manual deploy cycle.

