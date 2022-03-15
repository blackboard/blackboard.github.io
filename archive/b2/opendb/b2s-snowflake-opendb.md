---
layout: post
title: "B2s, Snowflake and the Open DB"
categories: Learn b2
id: archive-b2-snowflake-opendb
author: Mark Kauffman
---

# Introduction

This document shares some details about how a B2 can work with both the Learn tenant Open DB and Snowflake data. The information given here is not for common consumption and may or may not work at the time you read it. We've documented it here for future reference on an as-needed basis. If you're looking to develop a new integration, read about Learn's REST, LTI 1.3, and Caliper abilites. B2s are legacy and not to be considered for new integrations.

## WARNING: Nothing here is supported by Blackboard Learn Product Development. Use at your own risk. It may change at any time.

## NOTE: It takes 4 hours for Snowflake data to be updated with the latest statistics. When you are testing your B2 with Snowflake data, be certain to wait that 4 hours.

## Resources and Information
[Snowflake Date and Time](https://docs.snowflake.com/en/sql-reference/functions-date-time.html){: target='\_blank'}<br><br>
[Snowflake Date Add](https://docs.snowflake.com/en/sql-reference/functions/dateadd.html){: target='\_blank'}<br><br>
[Open DB](/archive/b2/opendb/intro-to-opendb){: target='\_blank'}<br><br>
[Building Blocks (B2s)](/archive/b2/getting-started/intro){: target='\_blank'}<br><br>
[Building Blocks Java Permissions](/archive/b2/advanced/java-permissions.md){: target='\_blank'}<br><br>

Plus, read all of the Snowflake SQL Reference documents. Note that “if the DB is using regular SQL, the syntax will have to be INTERVAL '1 day' as in the following query:
```
WITH activity as (
  SELECT user_pk1, course_pk1, max(timestamp) as last_access_date
    FROM activity_accumulator_archive
   WHERE timestamp IS NOT NULL
    AND timestamp > (CURRENT_TIMESTAMP - INTERVAL '1 day')
  GROUP BY user_pk1, course_pk1
)
```
 but if it’s using Postgres it will have to be INTERVAL '1' day.

### Prerequisiste
Be certain you are using the Learn platform library for 3900 or above from the [Maven Repository](https://mvnrepository.com/artifact/blackboard.platform/bb-platform)

### Helpful API Calls

BbDatabase.usingDataWarehouse() returns true when the Learn server is using Snowflake for statistics data, and false when it's using the local Learn DB. 

BbDatabase.getDefaultInstance().getConnectionManager() always connects to BBLEARN both when Snowflake is enabled, and when Snowflake is not enabled. Use as appropriate for the B2 use cases. <br>
<br>
BbDatabase.getReportingDefaultInstance().getConnectionManager() will establish a connection
To a Snowflake instance if Snowflake is enabled    (OR)
It will get connection to BBLearn_stats when snowflake is not enabled.<br>
<br>

### Necessary Permissions - Add to your B2 bb-manifest.xml file
```
<permission type= "java.lang.RuntimePermission" name="modifyThread"/>
<permission type= "java.lang.RuntimePermission" name="modifyThread" actions=""/>
<permission type="java.lang.RuntimePermission" name="db.connection.*" />
```

You might also try actions=”*” instead of actions=””.

