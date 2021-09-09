---
layout: post
title: "Introduction to OpenDB"
categories: Learn b2
id: archive-b2-opendb-intro-to-opendb
author: Scott Hurrey
---

# Introduction to OpenDB

In the summer of 2010, Blackboard made good on a commitment for platform
openness by publishing details about the database structures that power the
Blackboard Learn platform. Our Open Database initiative provides your
institution with documentation and guidance necessary to access and retrieve
critical information stored in the Learn platform about the activities of your
users. We can all recognize the potential benefits of this access. Through use
of the knowledge the Open Database initiative provides, IT staff can keep
track of system activity, model growth and plan for the future. Academic staff
can collect data about adoption, use and the efficacy of certain initiatives.
Institution leadership can use real data to evaluate return on investment and
make data-supported decisions.

**IMPORTANT NOTE**: _The Open Database documentation is provided to licensees of Blackboard Learn for the purposes described above. Accessing the documentation is an acceptance of agreement to these terms._

## Resources and Information

### Current Release

With each recent Service Pack for Learn, Blackboard provides current version
schema details and a PDF document that details the changes from the previous
Service Pack.

### Mitigating Risk

Having access to your data is exciting, but as with all enterprise software
this access comes with a degree of risk; Ill formed queries could result in
performance degradation or inadvertent writes, deletes, or drops may cause
database corruption. So, explore, but be careful.

Here are some practices which will help mitigate this risk:

#### _Don’t Modify or Insert Data Directly_:

Given this documentation is provided to enable discovery, reporting, and analysis the safest activity you can perform is based on simple targeted SELECT statements - do not perform data or database altering (delete/write) activities unless under direction of Blackboard Support, Consulting Services, or through use of the Building Block Persistence APIs.

**WARNING: _Performing database or data altering queries is outside the scope of this document and should be done only under direct guidance of Blackboard Inc. staff – doing otherwise could have dire repercussions for your SLA, LEARN system, and result in extended periods of downtime to repair._**

#### _Protect Your Data_:

Best practices set forth that any enterprise system be included in a backup/recovery strategy. Your Blackboard Learn system is no exception. Detailed coverage of the various means for managing backup and recovery for Oracle or Microsoft SQL Server is beyond the scope of this document, but rest assured that there are a variety of available resources at your disposal. Certainly your DBA may already have implemented such a plan; if not both Oracle and Microsoft have substantial documentation which will help determine the best approach for your institution and system architecture. Other sources include the Blackboard System Administrator Community and Blackboard Consulting Services. Protecting your data also includes considerations for access to the information. Whereas the Learn applications protects information from unauthorized access, it is up to you to ensure that access to the data is sufficiently secured.

#### _Work With Copies of Your Data_:

The easiest way to protect your data and not impact system performance is to work with a copy of your database. You may actually have a viable copy depending on your backup and recovery process. This allows you to interact with your “production data” without impacting your production system – which is a very good thing. By using a copy of your database you may test your queries for function as well as system performance. Generally, do not perform queries against production database. Unless you absolutely need access to live data and the queries have been functionally and load tested, we recommend that you devise a method for regular replication of your production data to a “reporting” environment. The frequency of the copy process may be determined by your reporting requirements. If you are only collecting end-of-semester statistics, then replication once a term may be sufficient. If you are using the data for early intervention efforts, then daily copies may be required.

#### _Functional and Performance Testing of Your Queries_:

If your requirements dictate that you need to report against live production data be extra careful. In addition to backing up and working with copies of your data you should always test your queries on a non-production environment to ensure that they are sound and do not result in negative impact on system performance. A malformed query can crash your database.
