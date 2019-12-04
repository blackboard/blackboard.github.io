# Data Collection Page with Common Tag Library Examples
*Author: Kelley MacEwen*
*Categories: ['Building Blocks', 'Examples', 'Getting Started']*
*Tags: ['develop', 'example', 'b2', 'sample code', 'migrated from edugarage', 'tag library', 'tag libraries', 'data collection', 'step', 'form', 'building blocks', 'taglibs', 'developer']*
---
# Sample Metadata

**Title**: Data Collection Page with Common Tag Library Examples

**Author**: George Kroner

**Blackboard Version**: 9.1.x

**Institution-Affilation**: Blackboard

**Keywords**: tag library, tag libraries, example, data collection, step, form

# Code Screenshot and Snippets

[![collection.gif](https://community.blackboard.com/servlet/JiveServlet/downlo
adImage/102-1411-1-62724/collection.gif)](https://community.blackboard.com/ser
vlet/JiveServlet/showImage/102-1411-1-62724/collection.gif)

Data collection page

//JSP from start to finish

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "[http://www.w3.org/TR/html4
/strict.dtd](https://community.blackboard.com/external-
link.jspa?url=http%3A//www.w3.org/TR/html4/strict.dtd)">

<%@ taglib uri="/bbNG" prefix="bbNG"%>

<bbNG:learningSystemPage>

<bbNG:breadcrumbBar environment="CTRL_PANEL" isContent="false">

<bbNG:breadcrumb>Example Form</bbNG:breadcrumb>

</bbNG:breadcrumbBar>

<bbNG:pageHeader>

<bbNG:pageTitleBar title="Example Data Collection Form">Example Data
Collection Form</bbNG:pageTitleBar>

</bbNG:pageHeader>

<bbNG:form action="submit.jsp" method="post" onSubmit="return
validateForm();">

<bbNG:dataCollection>

<bbNG:step title="First set of steps">

<bbNG:dataElement label="Name" isRequired="true" labelFor="Name">

<bbNG:textElement name="title" value="" size="50" maxLength="255"

isRequired="true" title="Title" />

</bbNG:dataElement>

<bbNG:dataElement label="Color of Name">

<bbNG:colorPicker name="color" />

</bbNG:dataElement>

<bbNG:dataElement label="Text" labelFor="descriptiontext">

<bbNG:textbox label="Description" name="description" isStandalonePage="false"
isContentLinking="false" text="" isMathML="false" />

</bbNG:dataElement>

</bbNG:step>

<bbNG:step title="Second set of steps">

<bbNG:dataElement>

<bbNG:filePicker required="true" mode="LOCAL_FILE_ONLY"
allowMultipleFiles="false" var="newFile"
baseElementName="newFile"></bbNG:filePicker>

</bbNG:dataElement>

<bbNG:dataElement label="Select Date">

<bbNG:dateRangePicker showTime="true" startCaption="Display After"

startDateTime="<%=null %>" endCaption="Display Before" endDateTime="<%=null
%>" />

</bbNG:dataElement>

</bbNG:step>

<bbNG:step title="Third set of steps">

<bbNG:dataElement label="Sample select">

<bbNG:radioElement name="radio" value="1"
></bbNG:radioElement><bbNG:radioElement name="radio"
value="0"></bbNG:radioElement>

</bbNG:dataElement>

</bbNG:step>

<bbNG:stepSubmit />

</bbNG:dataCollection>

</bbNG:form>

</bbNG:learningSystemPage>

# Download Sample

**Name****Size****Creator****Creation Date**

[Example_DataCollection.war](https://community.blackboard.com/servlet/JiveServ
let/download/1411-1-7899/Example_DataCollection.war)

3 kB

George Kroner

27 Jul 2010 04:32 PM

