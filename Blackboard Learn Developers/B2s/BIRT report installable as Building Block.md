# BIRT report installable as Building Block
*Author: Kelley MacEwen*  
*Categories: ['Building Blocks', 'Examples']*  
*Tags: ['develop', 'guides', 'building blocks', 'birt', 'report', 'migrated from edugarage', 'developer']*  
<hr />
# Sample Metadata

**Title**: BIRT report installable as Building Block   
**Author**: George Kroner   
**Blackboard** **Version**: 9.1.x   
**Institution-Affilation**: Blackboard   
**Keywords**: BIRT, report

#

# Code Screenshots and Snippet

[![report.gif](https://community.blackboard.com/servlet/JiveServlet/downloadIm
age/102-1399-2-61084/report.gif)](https://community.blackboard.com/servlet/Jiv
eServlet/showImage/102-1399-2-61084/report.gif)

BIRT report showing in SysAdmin panel

//from bb-manifest - report must exist as zip file under /WEB-INF

<reports>

<report-package file-name="reports.zip"/>

</reports>

# Download Sample:

**Name**

**Size**

**Creator**

**Creation Date**

[Example_BIRT.war](https://community.blackboard.com/servlet/JiveServlet/downlo
ad/1399-2-7879/Example_BIRT.war)

4 kB

George Kroner

27 Jul 2010 04:42 PM

# Other Notes

Follow the instructions for creating a BIRT report project prior to bundling
it within a Building Block in this manner. Reports are installable from
Building Blocks in Blackboard Learn 9.1 SP1 and above.

