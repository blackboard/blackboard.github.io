# Your First Building Blocks Project Using Eclipse - DevCon 2010
*Author: Kelley MacEwen*  
*Categories: ['Building Blocks', 'Getting Started', 'Tutorials']*  
*Tags: ['tutorials', 'b2', '9.1 sp4', 'devcon 2010', 'developer']*  
<hr />
# Tutorial recording

This recording and sample code will help you get up and running with your
first Building Blocks project using Eclipse. It covers how to use the built-in
Eclipse wizards to create, edit, build, and manually deploy a Building Block
to a development server. It also shows how to add the Blackboard supporting
Java jar libraries and UI tag libraries to your project. (Tip: As a best
practice, obtain the Blackboard jar libraries by downloading the installer jar
file from Behind the Blackboard, unzipping it, and selecting the
/payload/systemlib directory. Alternatively, you can select the
/blackboard/systemlib or /apps/tomcat/lib directory from your development
instance of Blackboard.) Finally, it covers how to automate the build process
using supporting developer tools and scripts supplied by Blackboard.

# Video recording

# bb-manifest documentation

The bb-manifest XML schema attached to this page can be used to verify your
bb-manifest.xml file that tells Blackboard how your Building Block plugin will
hook into the system.

## Configuring Eclipse

  1. Window > Preferences
  2. XML > XML Catalog > Add
  * Location: /path/to/bb-manifest-plugin.xsd
  * Key type: Namespace name
  * Key: [http://www.blackboard.com/bb-manifest-plugin.xsd](https://community.blackboard.com/external-link.jspa?url=http%3A//www.blackboard.com/bb-manifest-plugin.xsd)

What you get out of this

  * Syntax errors will show up as you edit
  * Smart completion is enabled
  * Inline documentation for the elements that have it

