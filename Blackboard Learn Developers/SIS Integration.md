# SIS Integration
*Author: Kelley MacEwen*  
*Categories: []*  
*Tags: ['develop', 'guides', 'learn', 'sis', 'developer']*  
<hr />
Blackboard Learn can be integrated with virtually any Student Information
System. Options exist to batch process CSV and XML files. Blackboard
Consulting can provide real-time adapters to many common SIS vendors. Please
contact your Blackboard representative for more information. Integration APIs
are exposed to build custom real-time adapters. As of Blackboard Learn Release
9.1 SP6, IMS Enterprise 2.0 and IMS LIS 2.0 are supported as integration
methods. As of Release 9.1 SP8, Flat File and legacy Blackboard XML formats
have been added as supported integration methods.

[Sample code](https://community.blackboard.com/external-link.jspa?url=https%3A
//behind.blackboard.com/s/developer/dlc/download.aspx%3Fd%3D1569)
exists to provide a template for building your own IMS LIS Building Block
adapter. Much information can be found for [SIS Integration on
help.blackboard.com](https://community.blackboard.com/external-
link.jspa?url=https%3A//en-us.help.blackboard.com/Learn/9.1_2014_04/
Administrator/070_Server_Management_and_Integrations/System_Integration/
SIS).

# Types of Integrations

There are 5 types of Integrations available, and the XML format will be
slightly different depending on the type selected. Although there are three
types of Integrations, there is not a limit to the number of Integrations a
system may have. It is unusual, though possible, to have a variety of
Integration types on a single system.

  * IMS Enterprise 1.1

  * IMS Enterprise 1.1 - Vista

  * IMS Learning Information Services ([Learning Information Services Specification Primer](https://www.imsglobal.org/lis/lisv2p0p1/LISSpecPrimerv2p0p1.html))

  * Snapshot Flat Files (text delimited, CSV)

  * Snapshot XML (A variant of IMS Enterprise 1.0 with Blackboard extensions)

# Shared Username and Password

Specify the Username and Password which is present on the (source) SIS system.
The shared Username and Password are required to maintain a secure connection.

# Uploading

Upload the XML file which contains the data to be added to Blackboard Learn.
Depending on the Integration type, the XML file will contain slight
variations.

# Integration Status

The available Status options are:

  * Testing

  * Inactive

  * Active

It is recommended that Integrations begin in the Testing status. Selecting
this status will allow you to test the Integration, and fix any issues which
may arise before committing to the Integration. Once the Testing is complete,
the status may be set to Inactive or Active. Setting the status to Inactive
will bring the data in, however, it will not be visible to users. Setting the
status to Active will bring the data in, and it will be visible to users. The
status can be changed at any time.

# Logging

Setting the log verbosity will dictate the type and depth of logging kept on
your system for the selected Integration. There are four log entry types or
classes:

  * Errors - Any fatal issues, any issues preventing create, update, disable, or purge operations.

  * Warnings - Any non-fatal issues, any issue with an individual record, or any successful operation which required a change to the record.

  * Messages - Any successful activity, including record types and counts, timing, and data.

  * Debug Items - All individual records, and data transformation attempts.

Logs can be filtered using an advanced search method which includes the type
of error, the Integration, and a date range. New log entries are easily
visible, with a count attached to the type of log entry. The logs can be
refreshed to retrieve the latest count, and details of each type of log.
Clearing the log count will only clear the number associated to the log type,
but will not purge the logs. Purging logs cannot be undone, and a verification
prompt is presented before the logs will be permanently purged. Purging logs
will only purge logs for the selected Integration, the counts can be cleared
across all Integrations, purging cannot.

# Data Source Support

Determine the location of information being brought to the Blackboard Learn
environment. Depending on your environment, select the Node in the hierarchy
to add the data. If no Nodes are located, all data will be brought in under
the top level of the hierarchy at your Institution.

# Advanced Configuration

The Learn Object Type, and the Object Type from your SIS system are mapped in
a 1 to 1 list. Select how to handle inserts, updates, and deletes for each
Object Type. Exercise caution when selecting options in this section.

