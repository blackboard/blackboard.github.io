# Building Blocks API Overview
Building Blocks are capable of fulfilling predominantly, but not exclusively
two scenarios:

  * Plugging-in additional or enhanced functionality to the core Blackboard product
  * Bridging the Blackboard product to an external system

A Building Block is simply a java based web application that runs on your
Blackboard application server. Packaged in the web application is an xml
configuration file called the bb-manifest that defines the security
restrictions on that particular Building Block as well as where the Building
Block hooks into the core product. For Building Blocks that have user
interfaces, tag libraries can be used to give the interface Blackboard's
distinct look and feel.

Building Blocks are used to access, add, remove, and manipulate data within
the Learning System. Examples of data types include users, courses, grades,
calendar entries, and content items. These objects map to the entities that a
user would see represented in the user interface.

Accessing and manipulating data involves using a series of loaders and
persisters that provide the logic and functionality required to save data into
and read data from the Blackboard Learning System.

## Functional Overview

### Announcement

Announcements are representations of an announcement within the Blackboard
application. These can be either system-wide or course-specific in nature.
Blackboard provides the ability to create, update, and remove announcements.

### Authentication

The authentication API allows developers to implement a customized
authentication scheme other than those that ship with the product. An example
would be creating a way to authenticate against a custom central
authentication database or other non-LDAP-based authentication service.

### Calendar

Calendar entries represent a calendar entry within the Blackboard application.
These can be system-wide, course-specific, or user-specific in nature.
Blackboard provides the ability to create, update, and remove calendar
entries.

### Content

Content refers to files that exist in the various content areas within a given
course site such as presentations or documents. The APIs give you the ability
to add and remove content, create links to content, create sequentially-
ordered lessons, and access data related to user interaction with a given
piece of content.

### Content System (for those clients who license the Blackboard Content
System)

The Blackboard Content System allows users to upload and share content within
the context of a content management system. The Content System APIs allow
content to be created, bookmarked, tagged with metadata, incorporated into a
portfolio, and acted on as part of a workflow.

### Context

The Context allows a developer to access information regarding a given user or
course based on that user's current interactions with the Learning System.

### Courses

Courses can be created, updated, deleted, and copied in the same ways that are
possible with the Snapshot enterprise data integration tool.

### Course Categories

Course categories allow courses to be categorized according to a given
taxonomy. Blackboard provides ways to create, update, and remove course
categories.

### Discussion Board

Discussion board conferences, forums, threads, and posts can be accessed. You
can also determine the status of a given posting and generate statistics on
discussion board usage.

### Enrollments

Course enrollments can be created, updated, and removed in the same ways that
are possible with the Snapshot enterprise data integration tool.

### File System

Various directories can be accessed directly giving access to logs, course
content, temp directories, and other areas.

### Gradebook

Individual gradebook items and scores can be created, updated, and removed.

### Logging

Allows access to the core Blackboard logging system including the ability to
define new logs.

### Navigation / Course Table of Contents

Allows the loading of the course table of contents.

### Plugins

Utility class for interacting with Building Blocks on a Blackboard server
giving access to information such as which Building Blocks are installed,
versions of which Blackboard products are installed, and other Building Block
configuration information.

### Portal data

Allows user-specific module data to be created and updated.

### Roles

Allows individual users to be associated with various institution/portal roles
in the same ways that are possible with the Snapshot enterprise data
integration tool.

### System configuration

Allows access to server configuration data such as application server name,
authentication type enabled, installation directory, database name, and SMTP
configuration.

### Users

Allows creation, update, and removal of users in the same ways that are
possible with the Snapshot enterprise data integration tool.

### Utility classes

Various classes to support functions such as byte->kilobyte conversion and
localized number representation.

