---
layout: post
title: "B2 API Documentation"
categories: Learn b2
id: archive-b2-gs-api_docs
author: Scott Hurrey
status: deprecated
---

# B2 API Documentation

As of 3700.9.0, we will be uploading these files as part of the build process
with each release of Learn SaaS to test, to facilitate better
readiness for SaaS releases to go to production. In order to accomplish this,
we are automating this process and pushing to the public maven repository:

- [Javadocs](https://bbprepo.blackboard.com/service/rest/repository/browse/public/bbdn/javadocs/)
- [Jdiff](https://bbprepo.blackboard.com/service/rest/repository/browse/public/bbdn/jdiff/)
- [Taglibs](https://bbprepo.blackboard.com/service/rest/repository/browse/public/bbdn/taglibs/)
- [OpenDb](https://bbprepo.blackboard.com/service/rest/repository/browse/public/bbdn/schema/)

Simply navigate to the link and select your version.

You can view these documentation packages directly in HTML using the following
links. You can also download the packages and access earlier versions of these
documents through [Behind the
Blackboard](https:///blackboard.secure.force.com/) on the Download
Files page for each release.

If an API is not shown in the publicly available documentation, it is not a
public API. Anthology does not support its use and we do not guarantee any
kind of ongoing maintenance or compatibility. Use unsupported APIs at your own
risk.

## API Documentation

Blackboard provides the Building Blocks API and Web Services Specifications
for Learn 9.1 in an HTML package in Javadoc format.

Blackboard also provides a "diff file" to detail the changes to the Building
Blocks API and Web Services Specifications since the previous release of
Blackboard Learn. This navigable list of added, removed, and changed public
APIs is an HTML package in Javadoc format.

## Tag Libraries

The familiar look and feel of the Learn user interface is provided to
developers through the Blackboard Tag Library. These are the same tag
libraries used in the Learn application and are available for your use.

Java Server Pages constructed using elements from the tag library render the
user interface in a manner familiar for users of the Learn application. Using
the tag libraries in your Building Block creates a 'seamless' ui experience
for your Building Block users.

## OpenDB

The Open Database Schema provides information about the Blackboard Learn
database structure, including layout and table inter-dependencies. This
information is intended for intermediate to expert database administrators, as
an aid to troubleshooting, capacity planning and analytics.

The schemas include a description of the data characteristics of the tables
and columns in the Blackboard Learn database, which includes datatypes and
sizes, nullability, index, sequence, key and constraint information.
Additional commentary is also provided for key tables and columns.

The Open Database Schema does not include a complete description of every
database object inBlackboard Learn. The following information is not included:

- Detailed commentary for some tables and columns.
- No table or column information for the Xythos engine file storage schema.
- No information about stored procedures, views, triggers, or database jobs.

**Note**: _These documents are available in English only._

| 9.1 Release | API Documentation                                                                              | Tag Libraries                                                                                      | OpenDB                                                                                            |
| ----------- | ---------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| Q2 2019     | [View API](https://library.blackboard.com/ref/09437c98-d952-421f-81d4-b5a1c9f89c9b/index.htm)  | [View Taglibs](https://library.blackboard.com/ref/f2b33f1e-98e0-4971-84e4-75594a6040aa/index.htm)  | [View Schema](https://library.blackboard.com/ref/6d327177-0ef6-455d-86cd-c186e8072a6a/index.htm)  |
| Q4 2018     | [View API](https://library.blackboard.com/ref/15075edc-3eb9-41d6-a6cb-3d458b5ce911/index.htm)  | [View Taglibs](https://library.blackboard.com/d/%3Fafdffb64-2cac-4be1-90e4-d0cc689e5cab)           | [View Schema](https://library.blackboard.com/ref/131b1542-9787-4925-91fd-3d680b9239ef/index.htm)  |
| Q2 2018     | [View API](https://library.blackboard.com/d/%3Fafae3973-a6ad-4c93-b774-072ea66f4acf)           | [View Taglibs](https://library.blackboard.com/d/%3F3568f4bb-7b95-44e7-aa33-40088b6e40c8)           | [View Schema](https://library.blackboard.com/ref/21b2b960-4389-46fb-95c7-b328a911a10a)            |
| Q4 2017     | [View API](https://library.blackboard.com/ref/e298c16a-936a-4af6-ad2f-65ab8221dcb5)            | [View Taglibs](https://library.blackboard.com/ref/c1cec285-55a0-4be4-a587-dd5f4ca4c37c)            | [View Schema](https://library.blackboard.com/d/%3F71047b43-8053-4231-9a09-46ab68abeecb)           |
| Q2 2017     | [View API](https://library.blackboard.com/ref/51f820b3-25a9-459b-b6bd-2a4fe6aedd8f/index.htm)  | [View Taglibs](https://library.blackboard.com/d/%3F5e058282-b48c-462c-a99b-63050c201f35)           | [View Schema](https://library.blackboard.com/d/%3F6e77844c-183a-4bce-b229-72961fe03e31)           |
| Q4 2016     | [View API](https://library.blackboard.com/d/%3F78e2d337-a6b3-4483-98b0-ac2a491f1135)           | [View Taglibs](https://library.blackboard.com/d/%3F2af249ea-1073-4c77-97ea-90d14c80f2a5)           | [View Schema](https://library.blackboard.com/d/%3Fb292c30f-4e6d-4211-8a2c-f28a12bfd3fd)           |
| Q2 2016     | [View API](https://library.blackboard.com/ref/16ce28ed-bbca-4c63-8a85-8427e135a710/index.htm)  | [View Taglibs](https://library.blackboard.com/ref/ece618d2-a7c2-488d-a816-c5a92ff09cd6/index.htm)  | [View Schema](https://library.blackboard.com/ref/a8859dd1-b28a-40e0-9aa4-763cf0d65e04/index.htm)  |
| Q4 2015     | [View API](https://library.blackboard.com/ref/564b246f-4b44-4e85-881e-3731b8a3fe45/index.html) | [View Taglibs](https://library.blackboard.com/ref/8ff5b468-6512-46a3-bc0b-2309de00b802/index.html) | [View Schema](https://library.blackboard.com/ref/589ebf8f-b007-425d-91ec-27d53e40fde4/index.html) |
